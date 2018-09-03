document.addEventListener('turbolinks:load', function() {
    var control = document.querySelector('#new_user');
    if (control) {control.addEventListener('input', matchPassword)}
})

function matchPassword() {
    var password = document.querySelector('#user_password');
    var passwordConfirmation = document.querySelector('#user_password_confirmation');
    var card = document.querySelector('.card')

    if (password.value === passwordConfirmation.value) {
        card.classList.remove('border-danger');
        card.classList.remove('border-primary');
        card.classList.add('border-success');
    } else if (passwordConfirmation.value === "") {
        card.classList.remove('border-danger');
        card.classList.remove('border-success');
        card.classList.add('border-primary');
    } else {
        card.classList.remove('border-primary');
        card.classList.remove('border-success');
        card.classList.add('border-danger');
    }
}