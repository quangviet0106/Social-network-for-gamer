//check invalid field
(function () {
    'use strict';
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation');
    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
})();


//chck validate passowrd
function validate_password() {

    var pass = document.getElementById('register_password').value;
    var confirm_pass = document.getElementById('register_confirm_password').value;
    if (pass != confirm_pass) {
        $('#alert-pass').html('Not Matching!').css('color', '#dc3545');
        document.getElementById('create-account1').disabled = true;
        document.getElementById('create-account1').style.opacity = (0.4);
    } else {
        $('#alert-pass').html('Matching!').css('color', 'green');
        document.getElementById('create-account1').disabled = false;
        document.getElementById('create-account1').style.opacity = (1);
    }
}
function validate_password1() {

    var pass = document.getElementById('forget_password').value;
    var confirm_pass = document.getElementById('forget_confirm_password').value;
    if (pass != confirm_pass) {
        $('#alert-pass1').html('Not Matching!').css('color', '#dc3545');
        document.getElementById('nextBtn').disabled = true;
        document.getElementById('nextBtn').style.opacity = (0.4);
    } else {
        $('#alert-pass1').html('Matching!').css('color', 'green');
        document.getElementById('nextBtn').disabled = false;
        document.getElementById('nextBtn').style.opacity = (1);
    }
}
