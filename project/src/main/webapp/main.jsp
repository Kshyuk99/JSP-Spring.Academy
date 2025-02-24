<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스크롤 애니메이션</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/9.0.3/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
    <script>
        'use strict';

        document.addEventListener("DOMContentLoaded", function() {
            const badgeEl = document.querySelector('header .badges');
            const toTopEl = document.querySelector('#to-top');

            window.addEventListener('scroll', _.throttle(function () {
                if (window.scrollY > 500) {
                    gsap.to(badgeEl, .6, { opacity: 0, display: 'none' });
                    gsap.to(toTopEl, .2, { x: 0 });
                } else {
                    gsap.to(badgeEl, .6, { opacity: 1, display: 'block' });
                    gsap.to(toTopEl, .2, { x: 100 });
                }
            }, 300));

            toTopEl.addEventListener('click', function () {
                gsap.to(window, .7, { scrollTo: 0 });
            });

            const fadeEls = document.querySelectorAll('.visual .fade-in');
            fadeEls.forEach(function (fadeEl, index) {
                gsap.to(fadeEl, 1, { delay: (index + 1) * .7, opacity: 1 });
            });

            new Swiper('.notice-line .swiper-container', { direction: 'vertical', autoplay: true, loop: true });
            new Swiper('.promotion .swiper-container', {
                autoplay: { delay: 5000 }, loop: true, slidesPerView: 3, spaceBetween: 10, centeredSlides: true,
                pagination: { el: '.promotion .swiper-pagination', clickable: true },
                navigation: { prevEl: '.promotion .swiper-prev', nextEl: '.promotion .swiper-next' }
            });
            new Swiper('.awards .swiper-container', {
                autoplay: true, loop: true, spaceBetween: 30, slidesPerView: 5,
                navigation: { prevEl: '.awards .swiper-prev', nextEl: '.awards .swiper-next' }
            });

            const promotionEl = document.querySelector('.promotion');
            const promotionToggleBtn = document.querySelector('.toggle-promotion');
            let isHidePromotion = false;

            promotionToggleBtn.addEventListener('click', function () {
                isHidePromotion = !isHidePromotion;
                promotionEl.classList.toggle('hide', isHidePromotion);
            });

            function random(min, max) {
                return parseFloat((Math.random() * (max - min) + min).toFixed(2));
            }

            function floatingObject(selector, delay, size) {
                gsap.to(selector, random(1.5, 2.5), {
                    delay: random(0, delay), y: size, repeat: -1, yoyo: true, ease: Power1.easeInOut
                });
            }

            floatingObject('.floating1', 1, 15);
            floatingObject('.floating2', .5, 15);
            floatingObject('.floating3', 1.5, 20);

            const spyEls = document.querySelectorAll('section.scroll-spy');
            spyEls.forEach(function (spyEl) {
                new ScrollMagic.Scene({ triggerElement: spyEl, triggerHook: .8 })
                    .setClassToggle(spyEl, 'show')
                    .addTo(new ScrollMagic.Controller());
            });
        });
    </script>
</head>
<body>
    <header>
        <div class="badges">배지</div>
        <button id="to-top">위로</button>
    </header>
    <section class="visual">
        <div class="fade-in">내용1</div>
        <div class="fade-in">내용2</div>
        <div class="fade-in">내용3</div>
    </section>
    <section class="promotion">
        <button class="toggle-promotion">토글</button>
    </section>
</body>
</html>
