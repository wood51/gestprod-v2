/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./app/views/**/*.{html,css}"],
  theme: {
    extend: {}
  },
  plugins: [require("@tailwindcss/typography"), require("daisyui")],
  daisyui: {
    themes: [
      {
        light: {
          ...require("daisyui/src/theming/themes")["light"]
        }
      }
    ]
  }
};
