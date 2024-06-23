const vm = Vue.createApp({  // vm stands for vue module. The word module describe the data we have in our app. vue describe the html we have in our app.
    data() {
      return {
        firstName: 'Dave',
        lastName: 'Joe'
      }
    },
    methods: {
      fullName() {
        return `${this.firstName} ${this.lastName.toUpperCase()}`
    }
  }
}).mount('#app')

// setTimeout(() => {
//   vm.firstName = 'Bob';
// }, 2000);
