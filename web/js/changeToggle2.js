const togglePasswordC2 = document.querySelector('#cPassword2');
const passwordC2 = document.querySelector('#changePassword2');

togglePasswordC2.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = passwordC2.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordC2.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});