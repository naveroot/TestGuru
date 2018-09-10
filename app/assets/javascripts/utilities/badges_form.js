document.addEventListener('turbolinks:load', function() {
    var control = document.querySelector('select');
    control.addEventListener('change',availableOptions);
})

function availableOptions() {
    var category = document.querySelector('.category')
    var level = document.querySelector('.level')
    var control = document.querySelector('select');

    if (control.value=== 'all_tests_in_level') {
        level.classList.remove('hide');
        category.classList.add('hide');
    } else if (control.value === 'all_tests_in_category') {
        level.classList.add('hide');
        category.classList.remove('hide');
    } else {
        level.classList.add('hide');
        category.classList.add('hide');
    }
}