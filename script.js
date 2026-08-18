const reduce = matchMedia('(prefers-reduced-motion: reduce)').matches;

/* stretch each headline word to exactly fill its box, the way Figma does */
const fits = [...document.querySelectorAll('.fit')];
function fitWords() {
  for (const el of fits) {
    el.style.transform = 'none';
    const box = el.parentElement.clientWidth;
    const nat = el.getBoundingClientRect().width;
    if (nat && box) el.style.transform = `scaleX(${box / nat})`;
  }
}
fitWords();
if (document.fonts) document.fonts.ready.then(fitWords);
let raf = 0;
addEventListener('resize', () => {
  cancelAnimationFrame(raf);
  raf = requestAnimationFrame(fitWords);
}, { passive: true });

/* entrance reveal */
const items = [...document.querySelectorAll('[data-rv]')];
if (reduce) {
  items.forEach(el => el.classList.add('in'));
} else {
  items.forEach((el, i) => {
    el.style.transitionDelay = Math.min(i, 8) * 60 + 'ms';
    requestAnimationFrame(() => requestAnimationFrame(() => el.classList.add('in')));
  });
}

/* watermark parallax */
const mark = document.querySelector('.watermark');
if (mark && !reduce && matchMedia('(min-width: 901px)').matches) {
  let tx = 0, ty = 0, cx = 0, cy = 0, praf = 0;
  const tick = () => {
    cx += (tx - cx) * .07;
    cy += (ty - cy) * .07;
    mark.style.transform = `translate3d(${cx}px,${cy}px,0)`;
    praf = Math.abs(tx - cx) > .1 || Math.abs(ty - cy) > .1 ? requestAnimationFrame(tick) : 0;
  };
  addEventListener('pointermove', e => {
    tx = (e.clientX / innerWidth - .5) * 22;
    ty = (e.clientY / innerHeight - .5) * 12;
    if (!praf) praf = requestAnimationFrame(tick);
  }, { passive: true });
}


/* contact dialog */
const modal = document.getElementById('contactModal');
const contactBtn = document.getElementById('contactBtn');
if (modal && contactBtn) {
  contactBtn.addEventListener('click', () => modal.showModal());
  modal.addEventListener('click', e => {
    if (e.target === modal) modal.close();
    if (e.target.closest('[data-close]')) modal.close();
  });
  modal.addEventListener('click', async e => {
    const btn = e.target.closest('[data-copy]');
    if (!btn) return;
    try {
      await navigator.clipboard.writeText(btn.dataset.copy);
      const was = btn.textContent;
      btn.textContent = 'copied!';
      setTimeout(() => { btn.textContent = was; }, 1200);
    } catch {}
  });
}
