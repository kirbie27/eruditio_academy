const togglePasswordC3 = document.querySelector('#cPassword3');
const passwordC3 = document.querySelector('#changePassword3');

togglePasswordC3.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = passwordC3.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordC3.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});