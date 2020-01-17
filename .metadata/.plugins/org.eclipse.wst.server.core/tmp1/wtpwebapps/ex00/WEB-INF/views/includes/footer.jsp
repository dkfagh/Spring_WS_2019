    <script>
        $( ".accordion" ).accordion({
            collapsible: true});

        var acc = document.getElementsByClassName("accordion");
        var i;
        
        for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
            } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
            } 
        });
        }
    </script>
    
    <footer>
        <div class="container">
            <a href="https://www.facebook.com/lincolnkorea" target="_blank"><img src="img/facebook.png" alt="facebook" style="width:34px;height:34px;"></a>
            <span>링컨 고객센터 : 1600-6003  긴급출동서비스 : 080-300-3673</span>
            <span>Copyright &copy; 2017 Ford Motor Company</span>
            <a href="https://www.lincoln-korea.com/site-map/">Site Map</a>&nbsp;|

            <a href="https://corporate.ford.com/homepage.html">&nbsp;Global Site</a>&nbsp;|

            <a href="https://www.lincoln-korea.com/privacy/">&nbsp;Privacy</a>
        </div>
    </footer>
</body>
</html>