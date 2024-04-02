




    document.addEventListener("DOMContentLoaded", function () {
      
        document.querySelectorAll('.send')[0].addEventListener('click', function() {
             document.querySelectorAll('.send')[1].classList.add('clicked');
             document.querySelectorAll('.send')[0].classList.remove('clicked');
             document.querySelector('.form').classList.remove('show');
             document.querySelector('.abc').classList.add('show');
        });

        document.querySelectorAll('.send')[1].addEventListener('click', function() {
            document.querySelectorAll('.send')[0].classList.add('clicked');
            document.querySelectorAll('.send')[1].classList.remove('clicked');
            document.querySelector('.form').classList.add('show');
            document.querySelector('.abc').classList.remove('show');
       });


    });