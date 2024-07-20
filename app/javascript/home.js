document.addEventListener('DOMContentLoaded', function() {
  const cepInput = document.getElementById('cep-input');
  const cepForm = document.getElementById('cep-form');

  cepInput.addEventListener('input', function() {
    this.value = this.value.replace(/\D/g, '');
    if (this.value.length > 8) {
      this.value = this.value.slice(0, 8);
    }
    if (this.value.length === 8) {
      cepForm.dispatchEvent(new Event('submit', { cancelable: true }));
    }
  });

  cepForm.addEventListener('submit', function(event) {
    event.preventDefault();
  });
});