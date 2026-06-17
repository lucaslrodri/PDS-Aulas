/* Demonstração interativa de convolução (estilo 3blue1brown / setosa.io).
 * Topo: imagem * kernel Sobel = bordas (vermelho/ciano). Passe o mouse sobre a
 * entrada para ver a vizinhança 3x3 * pesos = pixel de saída, dinamicamente.
 * Base (estática): convolução de distribuições P_X * P_Y = P_{X+Y}.
 */
(function () {
  "use strict";

  const KERNEL = [
    [-0.25, 0, 0.25],
    [-0.5, 0, 0.5],
    [-0.25, 0, 0.25],
  ];
  const NEG = [0.839, 0.122, 0.169]; // #d61f2b (negativo -> vermelho)
  const POS = [0.067, 0.659, 0.659]; // #11a8a8 (positivo -> ciano)
  const S = 8; // px por célula no canvas (resolução interna)

  const clamp = (v, a, b) => Math.max(a, Math.min(b, v));
  const fmtW = (w) => (w === 0 ? "0" : w.toFixed(2));

  // valor assinado -> cor (branco no zero, vermelho/ciano conforme sinal)
  function signedColor(v, maxAbs) {
    const mag = clamp(Math.abs(v) / (maxAbs || 1), 0, 1);
    const c = v < 0 ? NEG : POS;
    const r = Math.round(255 * (1 - mag * (1 - c[0])));
    const g = Math.round(255 * (1 - mag * (1 - c[1])));
    const b = Math.round(255 * (1 - mag * (1 - c[2])));
    return { css: "rgb(" + r + "," + g + "," + b + ")", light: r + g + b > 470 };
  }

  function paint(canvas, cols, rows, colorFn) {
    canvas.width = cols * S;
    canvas.height = rows * S;
    const ctx = canvas.getContext("2d");
    for (let y = 0; y < rows; y++)
      for (let x = 0; x < cols; x++) {
        ctx.fillStyle = colorFn(x, y);
        ctx.fillRect(x * S, y * S, S, S);
      }
    ctx.strokeStyle = "#d6d6d6";
    ctx.lineWidth = 1;
    for (let i = 0; i <= cols; i++) {
      ctx.beginPath();
      ctx.moveTo(i * S + 0.5, 0);
      ctx.lineTo(i * S + 0.5, rows * S);
      ctx.stroke();
    }
    for (let i = 0; i <= rows; i++) {
      ctx.beginPath();
      ctx.moveTo(0, i * S + 0.5);
      ctx.lineTo(cols * S, i * S + 0.5);
      ctx.stroke();
    }
  }

  // ---- parte interativa (imagem * kernel) ----------------------------------
  function initImage(root) {
    const src = root.dataset.src || "assets/kirby-pixel.png";
    const cols = parseInt(root.dataset.cols || "30", 10);
    const inCanvas = root.querySelector(".ik-in");
    const outCanvas = root.querySelector(".ik-out");
    const boxIn = root.querySelector(".ik-box-in");
    const boxOut = root.querySelector(".ik-box-out");
    const terms = root.querySelector(".ik-terms");
    const resultEl = root.querySelector(".ik-result");
    if (!inCanvas) return;

    const cells = [];
    for (let i = 0; i < 9; i++) {
      const term = document.createElement("div");
      term.className = "ik-term";
      const cell = document.createElement("div");
      cell.className = "ik-cell";
      const w = document.createElement("span");
      w.className = "ik-w";
      w.textContent = "×" + fmtW(KERNEL[(i / 3) | 0][i % 3]);
      term.appendChild(cell);
      term.appendChild(w);
      terms.appendChild(term);
      cells.push(cell);
    }

    const img = new Image();
    img.onload = function () {
      const rows = Math.max(1, Math.round((cols * img.height) / img.width));
      const tmp = document.createElement("canvas");
      tmp.width = cols;
      tmp.height = rows;
      const tctx = tmp.getContext("2d");
      tctx.fillStyle = "#fff";
      tctx.fillRect(0, 0, cols, rows);
      tctx.drawImage(img, 0, 0, cols, rows);
      let d;
      try {
        d = tctx.getImageData(0, 0, cols, rows).data;
      } catch (e) {
        root.style.display = "none";
        return;
      }

      const rgb = new Uint8ClampedArray(d);
      const gray = new Float32Array(cols * rows);
      for (let i = 0; i < cols * rows; i++)
        gray[i] = 0.299 * d[i * 4] + 0.587 * d[i * 4 + 1] + 0.114 * d[i * 4 + 2];
      const at = (x, y) =>
        gray[clamp(y, 0, rows - 1) * cols + clamp(x, 0, cols - 1)];

      // entrada colorida
      paint(inCanvas, cols, rows, (x, y) => {
        const i = (y * cols + x) * 4;
        return "rgb(" + rgb[i] + "," + rgb[i + 1] + "," + rgb[i + 2] + ")";
      });

      // convolução + normalização global
      const conv = new Float32Array(cols * rows);
      let maxAbs = 1e-6;
      for (let y = 0; y < rows; y++)
        for (let x = 0; x < cols; x++) {
          let s = 0;
          for (let dy = -1; dy <= 1; dy++)
            for (let dx = -1; dx <= 1; dx++)
              s += at(x + dx, y + dy) * KERNEL[dy + 1][dx + 1];
          conv[y * cols + x] = s;
          if (Math.abs(s) > maxAbs) maxAbs = Math.abs(s);
        }
      paint(outCanvas, cols, rows, (x, y) =>
        signedColor(conv[y * cols + x], maxAbs).css
      );

      const maxTerm = 255 * 0.5;
      let lastX = 13, lastY = 10;
      function update(cx, cy) {
        let sum = 0;
        for (let dy = -1; dy <= 1; dy++)
          for (let dx = -1; dx <= 1; dx++) {
            const v = Math.round(at(cx + dx, cy + dy));
            const w = KERNEL[dy + 1][dx + 1];
            sum += v * w;
            const cell = cells[(dy + 1) * 3 + (dx + 1)];
            const col = signedColor(v * w, maxTerm);
            cell.textContent = v;
            cell.style.background = col.css;
            cell.style.color = col.light ? "#333" : "#fff";
          }
        const r = Math.round(sum);
        const col = signedColor(sum, maxAbs);
        resultEl.textContent = r;
        resultEl.style.background = col.css;
        resultEl.style.color = col.light ? "#333" : "#fff";

        const cell = inCanvas.getBoundingClientRect().width / cols;
        boxIn.style.width = boxIn.style.height = 3 * cell + "px";
        boxIn.style.transform =
          "translate(" + (cx - 1) * cell + "px," + (cy - 1) * cell + "px)";
        boxOut.style.width = boxOut.style.height = cell + "px";
        boxOut.style.transform =
          "translate(" + cx * cell + "px," + cy * cell + "px)";
        lastX = cx;
        lastY = cy;
      }

      function onPoint(ev) {
        const rect = inCanvas.getBoundingClientRect();
        const cx = clamp(Math.floor(((ev.clientX - rect.left) / rect.width) * cols), 0, cols - 1);
        const cy = clamp(Math.floor(((ev.clientY - rect.top) / rect.height) * rows), 0, rows - 1);
        update(cx, cy);
      }
      inCanvas.addEventListener("mousemove", onPoint);
      inCanvas.addEventListener("click", onPoint);
      // toque: tap amostra (passivo, não bloqueia rolagem); arrastar varre os pixels
      inCanvas.addEventListener("touchstart", function (ev) {
        if (ev.touches[0]) onPoint(ev.touches[0]);
      }, { passive: true });
      inCanvas.addEventListener("touchmove", function (ev) {
        if (ev.touches[0]) { onPoint(ev.touches[0]); ev.preventDefault(); }
      }, { passive: false });
      // reposiciona os realces ao mudar de tamanho/orientação
      window.addEventListener("resize", function () { update(lastX, lastY); });

      update(13, 10);
      root.classList.add("ik-ready");
    };
    img.onerror = function () { root.style.display = "none"; };
    img.src = src;
  }

  // ---- histogramas (estáticos) P_X * P_Y = P_{X+Y} -------------------------
  function normalize(a) {
    const s = a.reduce((p, c) => p + c, 0);
    return a.map((v) => v / s);
  }
  function convolve(a, b) {
    const out = new Array(a.length + b.length - 1).fill(0);
    for (let i = 0; i < a.length; i++)
      for (let j = 0; j < b.length; j++) out[i + j] += a[i] * b[j];
    return out;
  }
  function lerpHex(c0, c1, t) {
    const p = (h) => [1, 3, 5].map((i) => parseInt(h.slice(i, i + 2), 16));
    const a = p(c0), b = p(c1);
    return "rgb(" + a.map((v, i) => Math.round(v + (b[i] - v) * t)).join(",") + ")";
  }
  function buildHist(el, data, c0, c1, labelHTML, labelColor) {
    const n = data.length, bw = 13, gap = 3, step = bw + gap, h = 104;
    const mx = Math.max.apply(null, data);
    const W = n * step - gap;
    let bars = "";
    for (let i = 0; i < n; i++) {
      const bh = (data[i] / mx) * h;
      bars +=
        '<rect x="' + i * step + '" y="' + (h - bh).toFixed(1) +
        '" width="' + bw + '" height="' + bh.toFixed(1) +
        '" rx="1" fill="' + lerpHex(c0, c1, n > 1 ? i / (n - 1) : 0) + '"/>';
    }
    el.innerHTML =
      '<svg viewBox="0 0 ' + W + " " + h + '" width="' + W + '" height="' + h +
      '" preserveAspectRatio="xMidYMax meet">' + bars + "</svg>" +
      '<div class="ik-hlabel" style="color:' + labelColor + '">' + labelHTML + "</div>";
  }
  function initHists(root) {
    const PX = normalize([1.0, 2.1, 3.3, 4.2, 3.3, 1.8, 1.2]);
    const PY = normalize([4.3, 2.5, 1.6, 1.15, 0.85, 0.62, 0.5, 0.42, 0.36]);
    const PXY = convolve(PX, PY);
    const map = {
      px: [PX, "#1f9bb3", "#5cc28d", "P<sub>X</sub>", "#1f9bb3"],
      py: [PY, "#e0503a", "#edb05c", "P<sub>Y</sub>", "#e0503a"],
      pxy: [PXY, "#7fa83a", "#dccb4a", "P<sub>X+Y</sub>", "#8a9a2a"],
    };
    root.querySelectorAll(".ik-hist").forEach((el) => {
      const cfg = map[el.dataset.dist];
      if (cfg) buildHist(el, cfg[0], cfg[1], cfg[2], cfg[3], cfg[4]);
    });
  }

  function init() {
    document.querySelectorAll(".ik-demo").forEach((root) => {
      initImage(root);
      initHists(root);
    });
  }
  if (document.readyState === "loading")
    document.addEventListener("DOMContentLoaded", init);
  else init();
})();
