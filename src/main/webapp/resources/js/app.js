document.addEventListener("DOMContentLoaded", function() {

  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.currentStep = 1;

      this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
      const $stepForms = form.querySelectorAll("form > div");
      this.slides = [...this.$stepInstructions, ...$stepForms];

      this.init();
    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }

    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep++;
          this.updateForm();
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;

      // TODO: Validation

      this.slides.forEach(slide => {
        slide.classList.remove("active");

        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

      this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
      this.$step.parentElement.hidden = this.currentStep >= 5;

      // TODO: get data from inputs and show them in summary

      // Lista inputów : worki, ulica, miasto, kod pocztowy, termin odbioru, uwagi
      let arrayOfInputs = document.querySelectorAll(".form-group--inline label input");
      function  getInputText(elements) {
        let newArray = [];
        elements.forEach(function (item) {
          newArray.push(item.value);
        })
        return newArray;
      }
      let array1 = getInputText(arrayOfInputs);
      console.log(array1)
      // Wyświetlanie danych adresowych i czasu odbioru
      let addressStreet = document.querySelector("[address]").firstElementChild.nextElementSibling.firstElementChild;
      let addressCity = document.querySelector("[address]").firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;
      let addressZipCode = document.querySelector("[address]").firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;
      addressStreet.innerText = array1[1]
      addressCity.innerText = array1[2];
      addressZipCode.innerText = array1[3];
      let pickupDate = document.querySelector("[pickup]").firstElementChild.nextElementSibling.firstElementChild;
      let pickupTime = document.querySelector("[pickup]").firstElementChild.nextElementSibling.firstElementChild.nextElementSibling;
      let pickupComment = document.querySelector("[pickup]").firstElementChild.nextElementSibling.firstElementChild.nextElementSibling.nextElementSibling;
      pickupDate.innerText = array1[4];
      pickupTime.innerText = array1[5];
      pickupComment.innerText = array1[6];

      // Lista kategorii
      let categories = document.querySelectorAll("[category-name]:checked");
      let array2 = getInputText(categories);

      // Wybrana instytucja
      let institution = document.querySelector("[institution-name]:checked")
          .nextElementSibling.nextElementSibling.firstElementChild.innerText;
      // Dla jakiej fundacji - display
      const institutionDisplay = document.querySelector(".icon-hand").nextElementSibling;
      institutionDisplay.innerText = institution;

      // Liczba worków - display oraz wybranych kategorii
      const bags = document.querySelector(".icon-bag").nextElementSibling;
      if(parseInt(array1[0]) === 1) {
        bags.innerText = array1[0] + " worek zawierający: " + array2[0].value;
      }else if(parseInt(array1[0]) === 2 || parseInt(array1[0]) === 3 ||  parseInt(array1[0]) === 4) {
        bags.innerText = array1[0] + " worki zawierające: " + array2.forEach(function(element) {
           console.log(element.title)
        });
      }else {
        bags.innerText = array1[0] + " worków zawierających: " + array2;
      }

    }

  }
  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }


});
