const togglePasswordC = document.querySelector('#cPassword');
const passwordC = document.querySelector('#changePassword');

togglePasswordC.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = passwordC.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordC.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});