import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
    './storage/framework/views/*.php',
    './resources/views/**/*.blade.php',
    './resources/js/**/*.vue',
  ],
  darkMode: 'class',
  theme: {
    fontFamily: {
      satoshi: ['Satoshi', 'sans-serif'],
    },
    extend: {
      colors: {
        'whiten': '#F1F5F9',
        'black': '#1C2434',
        'boxdark': '#24303F',
        'boxdark-2': '#1A222C',
        'body': '#64748B',
        'bodydark': '#AEB7C0',
        'bodydark1': '#DEE4EE',
        'bodydark2': '#8A99AF',
        'stroke': '#E2E8F0',
        'strokedark': '#2E3A47',
        'graydark': '#333A48',
        'meta-4': '#313D4A',
        'primary': '#3C50E0', // Biru Utama TailAdmin
        'danger': '#dc3545',
        'success': '#10B981',
        'warning': '#F59E0B',
        'gray-2': '#EFF4FB', // Abu-abu Hover (Light Gray)
      },
      boxShadow: {
        'default': '0px 8px 13px -3px rgba(0, 0, 0, 0.07)',
      }
    },
  },
  plugins: [forms],
}