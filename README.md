#


## Installation
Use comands in root folder
```bash

npm i

```

## Run
Use comands in root folder for development
```bash

docker-compose up
npm run dev

```
Use comands in root folder for deploy
```bash

docker-compose up
npm run build
npm run serve

```


## Environment variables
Database connection
```bash

DATABASE=
DATABASE_HOST=127.0.0.1
DATABASE_PORT=3306
DATABASE_USERNAME=root
DATABASE_PASSWORD=*

```

## Migrations
To create migration
```bash

npx sequelize migration:create --name=MIGRATION_NAME

```
To make migrations (*SERVER DO IT BY ITSELF WHEN STARTS*)
```bash

npx sequelize db:migrate

```

## Front-End (Vue)
To create a new Store with Pinea

```js
export const useStore = defineStore('Store', {
  state: () => ({
    variable: [],
  }),
  getters: {
    get() {
      return this.variable;
    },
  },
  actions: {
    async request() {
      // try {
      // axios
      //   .get(
      //     'http://191.96.251.106:3096/',
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      this.clients = response.data;
      //   })
      //     .catch((err) => {
      //       toast.error(err.response.data.errors, {
      //         autoClose: 5000,
      //         position: toast.POSITION.BOTTOM_RIGHT,
      //       });
      //     });
      //   return 0;
      // } catch (error) {
      //   return error;
      // }
    },

    async create() {
      // try {
      // axios
      //   .post(
      //     'http://191.96.251.106:3096/',
      //     obj,
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      this.clients = response.data;
      //   })
      //     .catch((err) => {
      //       toast.error(err.response.data.errors, {
      //         autoClose: 5000,
      //         position: toast.POSITION.BOTTOM_RIGHT,
      //       });
      //     });
      //   return 0;
      // } catch (error) {
      //   return error;
      // }
    },

    async edit() {
      // try {
      // axios
      //   .put(
      //     'http://191.96.251.106:3096/',
      //     obj,
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      this.clients = response.data;
      //   })
      //     .catch((err) => {
      //       toast.error(err.response.data.errors, {
      //         autoClose: 5000,
      //         position: toast.POSITION.BOTTOM_RIGHT,
      //       });
      //     });
      //   return 0;
      // } catch (error) {
      //   return error;
      // }
    },

    async delete() {
      // try {
      // axios
      //   .delete(
      //     'http://191.96.251.106:3096/',
      //     obj,
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      this.clients = response.data;
      //   })
      //     .catch((err) => {
      //       toast.error(err.response.data.errors, {
      //         autoClose: 5000,
      //         position: toast.POSITION.BOTTOM_RIGHT,
      //       });
      //     });
      //   return 0;
      // } catch (error) {
      //   return error;
      // }
    },
  },
  persist: true,
});
```