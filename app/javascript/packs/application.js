require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import "controllers";

const CANVAS = document.querySelector(".sparkle-canvas");
    const CTX = CANVAS.getContext("2d");
    const SPARKLE_COUNT_DIVISOR = 200000;
    const SCALE_MIN = 0.2;
    const SCALE_MAX = 1;
    const CYCLE_DURATION_IN_SECONDS = 10;
    const FRAMES_PER_SECOND = 60;
    const CYCLE_DURATION_IN_FRAMES =
      CYCLE_DURATION_IN_SECONDS * FRAMES_PER_SECOND;

    let currentFrame = 0;
    let sparkles = [];
    let worldTick;

    const randomBetween = (min, max) => Math.random() * (max - min) + min;

    const randomChoose = (choice1, choice2) =>
      Math.round(Math.random()) ? choice1 : choice2;

    const transition = (start, end, progress) =>
      start + (end - start) * progress;

    const clip = number => Math.max(0, Math.min(number, 1));

    const setMatrix = (x, y, scale, rotate) => {
      const xAx = Math.cos(rotate) * scale;
      const xAy = Math.sin(rotate) * scale;
      CTX.setTransform(xAx, xAy, -xAy, xAx, x, y);
    };

    const generateRandomSparkleProps = () => {
      const verticalStartOffset = 50;
      const scaleStart = randomBetween(SCALE_MIN, SCALE_MAX);
      const x = randomBetween(0, CANVAS.width);
      const yStart = randomBetween(0, CANVAS.height) - verticalStartOffset;
      const yEndMultiplier = 60;
      const yEnd = yStart + scaleStart * yEndMultiplier;
      const size = 24;
      const animationDurationInFrames = randomBetween(
        CYCLE_DURATION_IN_FRAMES * 0.6,
        CYCLE_DURATION_IN_FRAMES
      );
      const startingFrame = currentFrame;

      return {
        positionStart: [x, yStart],
        positionEnd: [x, yEnd],
        size: size,
        scaleStart: scaleStart,
        scaleEnd: 0,
        rotateStart: randomBetween(0, size * 0.2),
        rotateEnd: randomBetween(size * 0.4, size * 0.8),
        rotateDirection: randomChoose(-1, 1),
        hue: 215.1,
        shape: randomChoose("cross", randomChoose("square", "L")),
        animationDurationInFrames: animationDurationInFrames,
        startingFrame
      };
    };

    const generateSparklesToFillCanvas = () => {
      const containerArea = CANVAS.width * CANVAS.height;
      const sparkleCount = Math.round(containerArea / SPARKLE_COUNT_DIVISOR);
      const emptySparkleArray = new Array(sparkleCount).fill(0);

      return emptySparkleArray.map(() => generateRandomSparkleProps());
    };

    const drawFrame = () => {
      CTX.clearRect(0, 0, CANVAS.width, CANVAS.height);

      sparkles.forEach(set => {
        set.forEach(
          ({
            positionStart,
            positionEnd,
            size,
            scaleStart,
            scaleEnd,
            rotateStart,
            rotateEnd,
            rotateDirection,
            hue,
            shape,
            animationDurationInFrames,
            startingFrame
          }) => {
            CTX.save();

            const offsetCurrentFrame = currentFrame - startingFrame;
            const progress = clip(
              offsetCurrentFrame / animationDurationInFrames
            );
            const opacityProgress = clip(
              offsetCurrentFrame / (CYCLE_DURATION_IN_FRAMES * 0.05)
            );

            const opacity = transition(0, 1, opacityProgress);
            CTX.fillStyle = `hsla(${hue}, 36.5%, 37.6%, ${opacity})`;
            CTX.strokeStyle = `hsla(${hue}, 36.5%, 37.6%, ${opacity})`;
         

            setMatrix(
              positionStart[0],
              transition(positionStart[1], positionEnd[1], progress),
              transition(scaleStart, scaleEnd, progress),
              transition(
                rotateDirection * rotateStart,
                rotateDirection * rotateEnd,
                progress
              )
            );

            const strokeWidth = 1.5;

            if (shape === "cross") {
              const centerOffset = size / 2 - strokeWidth / 2;
              CTX.fillRect(-centerOffset, 0, size, strokeWidth);
              CTX.fillRect(0, -centerOffset, strokeWidth, size);
            } else if (shape === "square") {
              CTX.strokeRect(-size / 2, -size / 2, size, size);
            } else if (shape === "L") {
              CTX.fillRect(-size / 2, -size / 2, size, strokeWidth);
              CTX.fillRect(-size / 2, -size / 2, strokeWidth, size);
            }

            CTX.restore();
          }
        );
      });

      currentFrame += 1;
      worldTick = window.requestAnimationFrame(drawFrame);
    };

    const initialize = () => {
      CANVAS.width = window.innerWidth;
      CANVAS.height = window.innerHeight;
      worldTick = window.requestAnimationFrame(drawFrame);
    };

    initialize();

    const animate = () => {
      sparkles.push(generateSparklesToFillCanvas());

      if (sparkles.length > 20) {
        sparkles.shift();
      }
    };

    
    window.setInterval(animate, 700);
    window.setInterval(animate, 420);
    window.setInterval(animate, 650);
    window.setInterval(animate, 1000);