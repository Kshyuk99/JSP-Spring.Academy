<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색창 제어</title>
    <script>
        'use strict';

        document.addEventListener("DOMContentLoaded", function() {
            const searchEl = document.querySelector('.search');
            const searchInputEl = searchEl.querySelector('input');

            searchEl.addEventListener('click', function () {
                searchInputEl.focus();
            });

            searchInputEl.addEventListener('focus', function () {
                searchEl.classList.add('focused');
                searchInputEl.setAttribute('placeholder', '통합검색');
            });

            searchInputEl.addEventListener('blur', function () {
                searchEl.classList.remove('focused');
                searchInputEl.setAttribute('placeholder', '');
            });

            const thisYear = document.querySelector('.this-year');
            thisYear.textContent = new Date().getFullYear();
        });
    </script>
</head>
<body>
    <div class="search">
        <input type="text" placeholder="">
    </div>
    <footer>
        <span class="this-year"><%= java.time.Year.now() %></span>
    </footer>
</body>
</html>
