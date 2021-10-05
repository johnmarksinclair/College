async function wait() {
  return new Promise((resolve) => {
    let goal = new Date().getTime() + 5000;
    while (true) if (new Date().getTime() >= goal) break;
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