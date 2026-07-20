(() => {
  const passwordsByHost = {
    'lbg.wd3.myworkdayjobs.com': __LBG_PASSWORD__,
    'lowes.wd5.myworkdayjobs.com': __LOWES_PASSWORD__,
  };

  const password = passwordsByHost[location.hostname];
  if (!password) return;

  const fillPasswords = () => {
    for (const input of document.querySelectorAll('input[type="password"]')) {
      if (input.value) continue;
      const setter = Object.getOwnPropertyDescriptor(
        HTMLInputElement.prototype,
        'value',
      )?.set;
      setter?.call(input, password);
      input.dispatchEvent(new Event('input', { bubbles: true }));
      input.dispatchEvent(new Event('change', { bubbles: true }));
    }
  };

  const observer = new MutationObserver(fillPasswords);
  observer.observe(document, {
    childList: true,
    subtree: true,
  });
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', fillPasswords, { once: true });
  } else {
    fillPasswords();
  }
})();
