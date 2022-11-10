const togglePasswordR2 = document.querySelector('#rPassword2');
const passwordR2 = document.querySelector('#pwordR2');

togglePasswordR2.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = passwordR2.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordR2.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});