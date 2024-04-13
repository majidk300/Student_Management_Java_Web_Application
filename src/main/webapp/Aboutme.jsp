<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="com.Dao.StudentSaveDao"%>
<%@page import="com.entities.studentEntitiesFirstYear"%>
<%@page import="com.entities.loginEntitty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    loginEntitty userDash = (loginEntitty) session.getAttribute("user");

    if (userDash == null) {
        response.sendRedirect("index.jsp");
        return;
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" href="stylesheet/AddNewStudentStyle.css"/>

        <script src="https://cdn.tailwindcss.com"></script>


        <!--/*=============== GOOGLE FONTS ===============-->
        <!--@import url("https://fonts.googleapis.com/css2?family=Bai+Jamjuree:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&display=swap");-->


        <title>about-me</title>

        <%@include file="common/common-css-js.jsp" %>

    </head>
    <body>

        <!--NAVBAR-->
        <%@include file="common/navbarCommon.jsp" %>
        <!--NAVBAR END-->


        <!--=============== REMIXICONS ===============-->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />

        <!--==================== ABOUT ====================-->
        <section class="about section" id="about">
            <div class="about__container container grid">
                <h2 class="section__title-1">
                    <span>About Me.</span>
                </h2>

                <div class="about__perfil">
                    <div class="about__image">
                        <img src="imageIcons/myImage.jpg" alt="image" class="about__img">

                        <div class="about__shadow"></div>
                        <div class="geometric-box"></div>
                        <div class="about__box"></div>
                    </div>
                </div>

                <div class="about__info">
                    <p class="about__description">
                        Java Full Stack Web Developer proficient in <b> C++, Core Java</b> with
                        <b>Spring, Spring MVC, JSP, Servlets, JDBC, Hibernate</b> Frameworks
                        <b>Proven track record in creating
                            dynamic and efficient web applications.</b>
                    </p>

                    <ul class="about__list">
                        <li class="about__item">
                            <b>My Skills Are:</b> HTML, CSS, JavaScript,
                            , Git & GitHub, Bootstrap, & Tailwindcs.
                        </li>
                    </ul>

                    <div class="about__buttons">
                        <a href="https://www.instagram.com/majidk300/" target="blank" class="button">
                            <i class="ri-send-plane-line"></i> Contact Me
                        </a>

                        <a href="https://www.linkedin.com/in/majid-naseem-b8a579281?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" target="_blank" class="button__ghost">
                            <i class="ri-linkedin-box-line"></i>
                        </a>
                    </div>
                </div>
            </div>
        </section>



        <style>

            .search_students{
                display: none!important;
            }



            /*=============== VARIABLES CSS ===============*/

            html {
                scroll-behavior: smooth;
            }


            :root {
                --header-height: 3.5rem;

                /*========== Colors ==========*/
                /*Color mode HSL(hue, saturation, lightness)*/
                --first-color: hsl(14, 98%, 50%);
                --black-color: hsl(0, 0%, 0%);
                --black-color-light: hsl(0, 0%, 40%);
                --white-color: hsl(0, 0%, 95%);
                --title-color: hsl(0, 0%, 0%);
                --text-color: hsl(0, 0%, 35%);
                --text-color-light: hsl(0, 0%, 64%);
                --body-color: hsl(0, 0%, 87%);
                --container-color: hsl(0, 0%, 83%);

                /*========== Font and typography ==========*/
                /*.5rem = 8px | 1rem = 16px ...*/
                --body-font: "Bai Jamjuree", sans-serif;
                --biggest-font-size: 2.5rem;
                --h1-font-size: 1.75rem;
                --h2-font-size: 1.25rem;
                --h3-font-size: 1.125rem;
                --normal-font-size: 0.938rem;
                --small-font-size: 0.813rem;
                --smaller-font-size: 0.75rem;

                /*========== Font weight ==========*/
                --font-regular: 400;
                --font-medium: 500;
                --font-semi-bold: 600;
                --font-bold: 700;

                /*========== z index ==========*/
                --z-tooltip: 10;
                --z-fixed: 100;
            }

            /*========== Responsive typography ==========*/
            @media screen and (min-width: 1150px) {
                :root {
                    --biggest-font-size: 4.5rem;
                    --h1-font-size: 3rem;
                    --h2-font-size: 1.5rem;
                    --h3-font-size: 1.25rem;
                    --normal-font-size: 1rem;
                    --small-font-size: 0.875rem;
                    --smaller-font-size: 0.813rem;
                }
            }

            /*=============== BASE ===============*/
            body {
                font-family: var(--body-font);
                font-size: var(--normal-font-size);
                background-color: var(--body-color);
                color: var(--text-color);
                transition: background-color .4s; /* Pour le Dark theme */
            }

            h1,
            h2,
            h3,
            h4 {
                color: var(--title-color);
                font-weight: var(--font-bold);
            }

            ul {
                list-style: none;
            }

            a {
                text-decoration: none;
            }

            img {
                display: block;
                max-width: 100%;
                height: auto;
            }

            /*=============== THEME ===============*/
            .nav__buttons {
                display: flex;
                align-items: center;
                column-gap: 1rem;
            }

            .change-theme {
                font-size: 1.25rem;
                color: var(--title-color);
                cursor: pointer;
                transition: color .3s;
            }

            /*=============== REUSABLE CSS CLASSES ===============*/
            .container {
                max-width: 100%;
                margin-inline: 1.5rem;
            }

            .grid {
                display: grid;
                gap: 1.5rem;
            }

            .section {
                padding-block: 4rem 2rem;
            }

            .section__title-1,
            .section__title-2 {
                position: relative;
                font-size: var(--h1-font-size);
                width: max-content;
                margin: 0.75rem auto 2rem;
            }

            .section__title-1 span,
            .section__title-2 span {
                z-index: 5;
                position: relative;
            }

            .section__title-1::after,
            .section__title-2::after {
                content: "";
                width: 40px;
                height: 28px;
                background-color: hsla(14, 98%, 50%, 0.2);
                position: absolute;
                top: -4px;
                right: -8px;
            }

            .section__title-2::after {
                top: initial;
                bottom: -4px;
            }

            .geometric-box {
                position: absolute;
                width: 20px;
                height: 20px;
                background-color: var(--first-color);
                rotate: -30deg;
            }

            .geometric-box::after {
                content: "";
                position: absolute;
                width: 16px;
                height: 16px;
                border: 3px solid var(--black-color);
                left: -5px;
                top: -5px;
            }

            .main {
                overflow: hidden; /* For animation ScrollReveal */
            }

            /*=============== BUTTON ===============*/
            .button,
            .button__ghost {
                display: flex;
                align-items: center;
                justify-content: center;
                column-gap: 0.5rem;
            }

            .button {
                background-color: var(--black-color);
                padding: 1.1rem 1.5rem;
                color: var(--white-color);
                font-weight: var(--font-medium);
                border-radius: 0.75rem;
                transition: background-color 0.4s;
            }

            .button i {
                font-size: 1.25rem;
            }

            .button:hover {
                background-color: var(--first-color);
            }

            .button__ghost {
                border: 3px solid var(--black-color);
                color: var(--black-color);
                padding: 0.5rem;
                border-radius: 0.7rem;
                transition: border 0.4s, color 0.4s;
            }

            .button__ghost i {
                font-size: 1.25rem;
            }

            .button__ghost:hover {
                border: 3px solid var(--first-color);
            }

            /*=============== ABOUT ===============*/
            .about {
                background-color: var(--container-color);
                transition: background-color 0.4s;
            }

            .about__container {
                row-gap: 0;
            }

            .about__perfil {
                position: relative;
                justify-self: center;
                margin-block: 2.5rem 4.5rem;
            }

            .about__image {
                width: 220px;
            }

            .about__img {
                position: relative;
                border: 4px solid var(--white-color);
                z-index: 1;
                border-radius: 0.75rem;
                box-shadow: rgba(0, 0, 0, 0.2) 0px 8px 24px;
            }

            .about__shadow,
            .about__line,
            .about__box {
                position: absolute;
                border-radius: 0.75rem;
            }

            .about__shadow {
                width: 150px;
                height: 385px;
                background-color: var(--body-color);
                top: -2.5rem;
                right: -3.5rem;
                border-bottom: 4px solid var(--first-color);
                transition: background-color 0.4s;
            }

            .about__perfil .geometric-box {
                top: 1.5rem;
                right: -2.8rem;
            }

            .about__line {
                filter: invert(1);
                right: -1.25rem;
                top: 6rem;
                width: 50px;
                transition: filter 0.4s;
            }

            .about__box {
                width: 40px;
                height: 40px;
                background-color: var(--first-color);
                right: -0.5rem;
                bottom: 1.5rem;
            }

            .about__info {
                padding-left: 1.25rem;
            }

            .about__description {
                position: relative;
                color: var(--title-color);
                margin-bottom: 1.5rem;
            }

            .about__description::after {
                content: "";
                width: 20px;
                height: 1px;
                background-color: var(--title-color);
                position: absolute;
                left: -1.75rem;
                top: 0.5rem;
            }

            .about__list {
                list-style: square;
                color: var(--title-color);
                margin-bottom: 3rem;
            }

            .about__buttons {
                display: flex;
                justify-content: center;
                align-items: center;
                column-gap: 1rem;
            }

            /*=============== MEDIA QUERIES ===============*/
            /* For small devices */
            @media screen and (max-width: 340px) {
                .container {
                    margin-inline: 1rem;
                }
                .about__image {
                    width: 180px;
                }
                .about__shadow {
                    height: 330px;
                    right: -2.5rem;
                }
            }

            /* For medium devices */
            @media screen and (min-width: 576px) {
                .about__container{
                    grid-template-columns: 350px;
                    justify-content: center;
                }
            }

            /* For large devices */
            @media screen and (min-width: 1150px) {
                .container {
                    margin-inline: auto;
                }
                .about__container {
                    grid-template-columns: 460px 525px;
                    gap: 1rem 9rem;
                    align-items: center;
                    padding-block: 1rem;
                }
                .about__perfil {
                    order: -1;
                    grid-row: 1 / 3;
                }
                .about__image {
                    width: 350px;
                }
                .about__img {
                    border: 6px solid var(--white-color);
                }
                .about__shadow {
                    width: 240px;
                    height: 615px;
                    top: -4rem;
                    right: -5.5rem;
                    border-bottom: 6px solid var(--first-color);
                }
                .about__perfil .geometric-box {
                    right: -4rem;
                    top: 4.5rem;
                }
                .about__line {
                    width: 80px;
                    right: -2rem;
                    top: 10rem;
                }
                .about__box {
                    width: 64px;
                    height: 64px;
                    right: -.75rem;
                }
                .about__container .section__title-1 {
                    align-self: flex-end;
                    margin-inline: 0;
                }
                .about__info {
                    align-self: flex-start;
                    padding-left: 3rem;
                }
                .about__description {
                    font-size: var(--h2-font-size);
                    margin-bottom: 2rem;
                }
                .about__description::after {
                    width: 32px;
                    height: 2px;
                    left: -3rem;
                    top: 14px;
                }
                .about__list {
                    margin-bottom: 5rem;
                }
                .about__buttons {
                    justify-content: initial;
                }
                .button__ghost {
                    padding: 0.75rem;
                }
                .button__ghost i {
                    font-size: 1.5rem;
                }
            }



        </style>


    </body>
</html>
