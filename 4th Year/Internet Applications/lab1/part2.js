async function wait() {
  return new Promise((resolve) => {
    let start = new Date().getTime();
    while (true) {
      if (new Date().getTime() >= start + 5000) break;
    }
    resolve();
  });
}

async function countdown() {
  for (let i = 25; i >= 0; i--) {
    console.log(i);
    if (i != 0) await wait();
  }
}

countdown();
