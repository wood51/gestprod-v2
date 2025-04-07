/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      './app/views/**/*.{html,css,php}'
    ],
    theme: {
      extend: {},
    },
    plugins: [require('daisyui')],
  }


