const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  const elements = payjp.elements();
  const cardNumberElement = elements.create('cardNumber');
  const cardExpiryElement = elements.create('cardExpiry');
  const cardCvcElement = elements.create('cardCvc');

  cardNumberElement.mount('#number-form');
  cardExpiryElement.mount('#expiry-form');
  cardCvcElement.mount('#cvc-form');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(cardNumberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      cardNumberElement.clear();
      cardExpiryElement.clear();
      cardCvcElement.clear();

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);