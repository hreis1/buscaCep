document.addEventListener('DOMContentLoaded', function() {
  const cepInput = document.getElementById('cep-input');
  const cepForm = document.getElementById('cep-form');

  const valueLength = cepInput.value.length;
  cepInput.focus();
  cepInput.setSelectionRange(valueLength, valueLength);

  cepInput.addEventListener('input', function() {
    this.value = this.value.replace(/\D/g, '');
    if (this.value.length > 8) {
      this.value = this.value.slice(0, 8);
    }
    if (this.value.length === 8) {
      cepForm.submit();
    }
  });
  cepForm.addEventListener('submit', function(event) {
    event.preventDefault();
  });
});
