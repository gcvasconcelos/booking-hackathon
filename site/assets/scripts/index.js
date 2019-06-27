let flag = 0;
let buttom = document.querySelector('.bot-buttom');
let openButtom = document.querySelector('.bot-buttom .buttom-icon');
openButtom.addEventListener("click", () => {
    buttom.classList.add("-active");
    if (flag == 0) {
        const chat = new WatsonChat(config);
        flag = 1;
    }
});

let closeButtom = document.querySelector('.bot-buttom .close');
closeButtom.addEventListener("click", () => {
    buttom.classList.remove("-active");
});
