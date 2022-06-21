<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
</head>
<body>
<header class="header--form-page">
  <nav class="container container--70">
    <ul class="nav--actions">
      <li class="logged-user">
        Witaj Agata
        <ul class="dropdown">
          <li><a href="#">Profil</a></li>
          <li><a href="#">Moje zbiórki</a></li>
          <li><a href="#">Wyloguj</a></li>
        </ul>
      </li>
    </ul>

    <ul>
      <li><a href="index.jsp" class="btn btn--without-border active">Start</a></li>
      <li><a href="index.jsp#steps" class="btn btn--without-border">O co chodzi?</a></li>
      <li><a href="index.jsp#about-us" class="btn btn--without-border">O nas</a></li>
      <li><a href="index.jsp#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
      <li><a href="index.jsp#contact" class="btn btn--without-border">Kontakt</a></li>
    </ul>
  </nav>

  <div class="slogan container container--90">
    <div class="slogan--item">
      <h1>
        Oddaj rzeczy, których już nie chcesz<br />
        <span class="uppercase">potrzebującym</span>
      </h1>

      <div class="slogan--steps">
        <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
        <ul class="slogan--steps-boxes">
          <li>
            <div><em>1</em><span>Wybierz rzeczy</span></div>
          </li>
          <li>
            <div><em>2</em><span>Spakuj je w worki</span></div>
          </li>
          <li>
            <div><em>3</em><span>Wybierz fundację</span></div>
          </li>
          <li>
            <div><em>4</em><span>Zamów kuriera</span></div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</header>

<section class="form--steps">
  <div class="form--steps-instructions">
    <div class="form--steps-container">
      <h3>Ważne!</h3>
      <p data-step="1" class="active">
        Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
        wiedzieć komu najlepiej je przekazać.
      </p>
      <p data-step="2">
        Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
        wiedzieć komu najlepiej je przekazać.
      </p>
      <p data-step="3">
        Wybierz jedną, do
        której trafi Twoja przesyłka.
      </p>
      <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
    </div>
  </div>

  <div class="form--steps-container">
    <div class="form--steps-counter">Krok <span>1</span>/4</div>

    <form:form method="post" modelAttribute="donation">

      <!-- STEP 1: class .active is switching steps -->
      <div data-step="1" class="active">
        <h3>Zaznacz co chcesz oddać:</h3>
        <c:forEach items="${categories}" var="category">
        <div class="form-group form-group--checkbox">
          <label>
            <input type="checkbox" name="categories" value="${category.id}" category-name="${category.name}" title="${category.name}"/>
            <span class="checkbox"></span>
            <span class="description">${category.name}</span>
          </label>
        </div>
        </c:forEach>
        <div class="form-group form-group--buttons">
          <button type="button" class="btn next-step">Dalej</button>
        </div>
      </div>


      <!-- STEP 2 -->
      <div data-step="2">
        <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

        <div class="form-group form-group--inline">
          <label>
            Liczba 60l worków:
            <form:input path="quantity"/>
            <form:errors path="quantity"/>
            <span id="quantity.errors" class="ui-state-error">Wpisz liczbe</span>
          </label>
        </div>

        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step">Wstecz</button>
          <button type="button" class="btn next-step">Dalej</button>
        </div>
      </div>



      <!-- STEP 3 -->
      <div data-step="3">
        <h3>Wybierz organizacje, której chcesz pomóc:</h3>

        <c:forEach items="${institutions}" var="institution">
        <div class="form-group form-group--checkbox">
          <label>
            <input type="radio" name="institution" value="${institution.id}" institution-name="${institution.name}"/>
            <span class="checkbox radio"></span>
            <span class="description">
                  <div class="title">Fundacja “${institution.name}”</div>
                  <div class="subtitle">${institution.description}</div>
                </span>
          </label>
        </div>
        </c:forEach>

        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step">Wstecz</button>
          <button type="button" class="btn next-step">Dalej</button>
        </div>
      </div>

      <!-- STEP 4 -->
      <div data-step="4">
        <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

        <div class="form-section form-section--columns">
          <div class="form-section--column">
            <h4>Adres odbioru</h4>
            <div class="form-group form-group--inline">
              <label> Ulica <form:input path="street"/> </label>
              <form:errors path="street" cssClass="error" element="div"/>
              <span id="street.errors" class="error">Nie może być null</span>
            </div>
            <div class="form-group form-group--inline">
              <label> Miasto <form:input path="city"/> </label>
              <form:errors path="city" cssClass="error" element="div"/>
              <span id="city.errors" class="error">Nie może być null</span>
            </div>
            <div class="form-group form-group--inline">
              <label>Kod pocztowy <form:input path="zipCode"/></label>
              <form:errors path="zipCode" cssClass="error" element="div"/>
              <span id="zipCode.errors" class="error">Nie może być null</span>
            </div>
          </div>
          <div class="form-section--column">
            <h4>Termin odbioru</h4>
            <div class="form-group form-group--inline">
              <label> Data <form:input type="date" path="pickUpDate"/> </label>
              <form:errors path="pickUpDate" cssClass="error" element="div"/>
              <span id="pickUpDate.errors" class="error">yyyy-MM-dd</span>
            </div>
            <div class="form-group form-group--inline">
              <label> Godzina <form:input type="time" path="pickUpTime"/> </label>
              <form:errors path="pickUpTime" cssClass="error" element="div"/>
              <span id="pickUpTime.errors" class="error">hh:mm AM or PM</span>
            </div>
            <div class="form-group form-group--inline">
              <label>Uwagi dla kuriera <form:input path="pickUpComment"/></label>
              <form:errors path="pickUpComment" cssClass="error" element="div"/>
              <span id="pickUpComment.errors" class="error"></span>
            </div>
          </div>
        </div>
        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step">Wstecz</button>
          <button type="button" class="btn next-step">Dalej</button>
        </div>
      </div>

      <!-- STEP 5 -->
      <div data-step="5">
        <h3>Podsumowanie Twojej darowizny</h3>

        <div class="summary">
          <div class="form-section">
            <h4>Oddajesz:</h4>
            <ul>
              <li>
                <span class="icon icon-bag"></span>
                <span class="summary--text"></span>
              </li>

              <li>
                <span class="icon icon-hand"></span>
                <span class="summary--text"></span>
              </li>
            </ul>
          </div>

          <div class="form-section form-section--columns">
            <div class="form-section--column" address="">
              <h4>Adres odbioru:</h4>
              <ul>
                <li></li>
                <li></li>
                <li></li>
              </ul>
            </div>

            <div class="form-section--column" pickup="">
              <h4>Termin odbioru:</h4>
              <ul>
                <li></li>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step">Wstecz</button>
          <button type="submit" class="btn">Potwierdzam</button>
        </div>
      </div>
    </form:form>
  </div>
</section>

<footer>
  <div class="contact">
    <h2>Skontaktuj się z nami</h2>
    <h3>Formularz kontaktowy</h3>
    <form class="form--contact">
      <div class="form-group form-group--50">
        <input type="text" name="name" placeholder="Imię" />
      </div>
      <div class="form-group form-group--50">
        <input type="text" name="surname" placeholder="Nazwisko" />
      </div>

      <div class="form-group">
            <textarea
                    name="message"
                    placeholder="Wiadomość"
                    rows="1"
            ></textarea>
      </div>

      <button class="btn" type="submit">Wyślij</button>
    </form>
  </div>
  <div class="bottom-line">
    <span class="bottom-line--copy">Copyright &copy; 2018</span>
    <div class="bottom-line--icons">
      <a href="#" class="btn btn--small"><img src="<c:url value="/resources/images/icon-facebook.svg"/>"/></a>
      <a href="#" class="btn btn--small"><img src="<c:url value="/resources/images/icon-instagram.svg"/>"/></a>
    </div>
  </div>
</footer>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>

