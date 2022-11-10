const togglePasswordR = document.querySelector('#rPassword');
const passwordR = document.querySelector('#pwordR');

togglePasswordR.addEventListener('click', function (e) {
    
    // toggle the type attribute
    const type = passwordR.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordR.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});