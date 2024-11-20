document.addEventListener("DOMContentLoaded", function() {
    const toggleSwitch = document.getElementById("dark-mode-toggle");
  
    // Check if user has a preference saved
    if (localStorage.getItem("theme") === "dark") {
      document.body.classList.add("dark-mode");
    }
  
    toggleSwitch.addEventListener("click", function() {
      document.body.classList.toggle("dark-mode");
  
      // Save user preference in localStorage
      if (document.body.classList.contains("dark-mode")) {
        localStorage.setItem("theme","dark" );
      } else {
        localStorage.setItem("theme", "light" );
      }
    });
  });
  //---------------------------------------------------------------------------------------
  document.addEventListener("DOMContentLoaded", function() {
    const lamp = document.getElementById("lamp");
    const string = document.getElementById("string");
  
    // Initialize with user's saved preference
    if (localStorage.getItem("theme") === "dark") {
      document.body.classList.add("dark-mode");
    }
  
    // Toggle dark mode when string is pulled
    string.addEventListener("click", function() {
      document.body.classList.toggle("dark-mode");
  
      // Save the theme preference
      if (document.body.classList.contains("dark-mode")) {
        localStorage.setItem("theme","light" );
      } else {
        localStorage.setItem("theme","dark" );
      }
    });
  });
  