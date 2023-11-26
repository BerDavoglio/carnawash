/* eslint-disable import/prefer-default-export */
import { defineStore } from 'pinia';
// import axios from 'axios';

// import { toast } from 'vue3-toastify';

export const useLoginStore = defineStore('loginStore', {
  state: () => ({
    token: '',
    perfil: {},
  }),
  getters: {
    getToken() {
      return this.token;
    },
    getPerfil() {
      return this.perfil;
    },
  },
  actions: {
    async login() {
      //   try {
      //     axios
      //       .post('http://127.0.0.1:3096/jwt/', {
      //         email,
      //         password,
      //       })
      //       .then((response) => {
      //         this.token = response.data.token;
      //       }).then(() => {
      //         this.requestPerfil();
      //       })
      //       .then(() => {
      //         if (this.getPerfil.role === 'admin') {
      //           func('admin');
      //         }
      //         if (this.getPerfil.role === 'user') {
      //           func('perfil');
      //         }
      //         this.requestRole();
      //       })
      //       .catch((err) => {
      //         toast.error(err.response.data.errors, {
      //           autoClose: 5000,
      //           position: toast.POSITION.BOTTOM_RIGHT,
      //         });
      //       });
      //     return 0;
      //   } catch (error) {
      //     return error;
      //   }
    },
    async requestPerfil() {
      //   try {
      //     axios
      //       .get(
      //         'http://127.0.0.1:3096/users',
      //         { headers: { Authorization: `Bearer ${this.token}` } },
      //       )
      //       .then((response) => {
      //         this.perfil = response.data;
      //       });
      //     return 0;
      //   } catch (error) {
      //     return error;
      //   }
    },

    async updatePerfil() {
      //   try {
      //     axios
      //       .put(
      //         'http://127.0.0.1:3096/users/',
      //         obj,
      //         { headers: { Authorization: `Bearer ${this.token}` } },
      //       )
      //       .then((response) => {
      //         toast.success('Perfil atualizado com sucesso!', {
      //           autoClose: 5000,
      //           position: toast.POSITION.BOTTOM_RIGHT,
      //         });
      //         const [per, tok] = response.data;
      //         this.perfil = per;
      //         this.token = tok;
      //         window.location.reload();
      //       })
      //       .catch((err) => {
      //         toast.error(err.response.data.errors, {
      //           autoClose: 5000,
      //           position: toast.POSITION.BOTTOM_RIGHT,
      //         });
      //       });
      //     return 0;
      //   } catch (error) {
      //     return error;
      //   }
    },

    async logout() {
      //   try {
      //     this.token = '';
      //     this.role = '';
      //     func();
      //     return 0;
      //   } catch (error) {
      //     return error;
      //   }
    },
  },
  persist: true,
});

export const useDashboardStore = defineStore('dashboardStore', {
  state: () => ({
    totalRevenue: 0,
    totalProfit: 0,
    todayRevenue: 0,
    weekRevenue: 0,
    monthRevenue: 0,
    graphData: [],
    ratings: [],
    lastWashes: [],
  }),
  getters: {
    getTotalRevenue() {
      return this.totalRevenue;
    },
    getTotalProfit() {
      return this.totalProfit;
    },
    getTodayRevenue() {
      return this.todayRevenue;
    },
    getWeekRevenue() {
      return this.weekRevenue;
    },
    getMonthRevenue() {
      return this.monthRevenue;
    },
    getGraphData() {
      return this.graphData;
    },
    getRatings() {
      return this.ratings;
    },
    getLastWashes() {
      return this.lastWashes;
    },
  },
  actions: {
    async requestTotalRevenue() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestTotalProfit() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestTodayRevenue() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestWeekRevenue() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestMonthRevenue() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestGraphData() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestRatings() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestLastWashes() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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

export const useClientStore = defineStore('clientStore', {
  state: () => ({
    clients: [],
    newClients: 0,
    inactiveClients: 0,
  }),
  getters: {
    getClients() {
      return this.clients;
    },
    getNewClients() {
      return this.newClients;
    },
    getInactiveClients() {
      return this.inactiveClients;
    },
  },
  actions: {
    async requestClients() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestOneClient() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      return response.data;
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
    async requestClientCars() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      return response.data;
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
    async requestNewClients() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      this.newClients = response.data;
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
    async requestInativeClients() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      this.inactiveClients = response.data;
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

    async createClient() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async createClientCar() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async updateClient() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async updateClientCar() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async deleteClient() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async deleteClientCar() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

export const useWashersStore = defineStore('washerStore', {
  state: () => ({
    washers: [],
    newWashers: 0,
    inactiveWashers: 0,
  }),
  getters: {
    getClients() {
      return this.washers;
    },
    getNewClients() {
      return this.newWashers;
    },
    getInactiveClients() {
      return this.inactiveWashers;
    },
  },
  actions: {
    async requestWashers() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      this.washers = response.data;
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
    async requestOneWasher() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      return response.data;
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
    async requestNewWashers() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      this.newWashers = response.data;
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
    async requestInativeWashers() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //      this.inactiveWashers = response.data;
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

    async createWasher() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
      //     obj,
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //     await this.requestWashers();
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

    async editBankInfo() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
      //     obj,
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //     await this.requestWashers();
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
    async editWasherInfo() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
      //     obj,
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //     await this.requestWashers();
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
    async changeApprovalWasher() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
      //     obj,
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //     await this.requestWashers();
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
    async changeEnableWasher() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
      //     obj,
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //     await this.requestWashers();
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

    async deleteWasher() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
      //     obj,
      //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
      //   )
      //   .then((response) => {
      //     await this.requestWashers();
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

export const useAdminStore = defineStore('adminStore', {
  state: () => ({
    admins: [],
    userTypes: [],
  }),
  getters: {
    getAdmins() {
      return this.admins;
    },
    getUserTypes() {
      return this.userTypes;
    },
  },
  actions: {
    async requestAdmins() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestUserTypes() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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

    async createClient() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async createUserType() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async editAdmin() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async editUserType() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async deleteAdmin() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async deleteUserType() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

export const useFAQTermsStore = defineStore('faqTermsStore', {
  state: () => ({
    faq: [],
    terms: '',
  }),
  getters: {
    getFAQ() {
      return this.faq;
    },
    getTerms() {
      return this.terms;
    },
  },
  actions: {
    async requestFAQs() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestTerms() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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

    async createFAQ() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async editFAQ() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async editTerms() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async deleteOneFAQ() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async deleteAllFAQ() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async downloadFileFaq() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async downloadFileTerms() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

export const useQuizStore = defineStore('faqQuizStore', {
  state: () => ({
    quiz: [],
    average: [],
    statistics: [],
  }),
  getters: {
    getQuiz() {
      return this.quiz;
    },
    getAverage() {
      return this.average;
    },
    getStatistics() {
      return this.statistics;
    },
  },
  actions: {
    async requestQuizes() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestAverage() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestStatistics() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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

    async createQuiz() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async editQuiz() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async deleteOneQuiz() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async deleteAllQuiz() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async downloadFile() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

export const useServicesStore = defineStore('servicesStore', {
  state: () => ({
    additional: [],
    size: [],
    regular: [],
    markup: {},
  }),
  getters: {
    getAdditional() {
      return this.additional;
    },
    getSize() {
      return this.size;
    },
    getRegular() {
      return this.regular;
    },
    getMarkup() {
      return this.markup;
    },
  },
  actions: {
    async requestAdditional() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestSize() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestRegular() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestMarkup() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestAdditionalData() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestSizeData() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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

    async createAdditional() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async createSize() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async createRegular() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async editAdditional() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async editSize() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async editRegular() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async editMarkup() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async deleteAdditional() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async deleteSize() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async deleteRegular() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

export const useNotificationStore = defineStore('notificationStore', {
  state: () => ({
    notifications: [],
    notificationHistory: [],
    programmedNotification: [],
  }),
  getters: {
    getNotification() {
      return this.notifications;
    },
    getNotificationHistory() {
      return this.notificationHistory;
    },
    getProgrammedNotification() {
      return this.programmedNotification;
    },
  },
  actions: {
    async requestNotification() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestNotificationHistory() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestProgrammedNotification() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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

    async createNotification() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async createSent() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async editNotification() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async editProgrammedNotification() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async deleteNotification() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

export const useCouponsStore = defineStore('couponsStore', {
  state: () => ({
    coupons: [],
    couponsHistory: [],
    couponBanner: {},
    referentialHistory: [],
  }),
  getters: {
    getCoupons() {
      return this.coupons;
    },
    getCouponsHistory() {
      return this.couponsHistory;
    },
    getCouponBanner() {
      return this.couponBanner;
    },
    getReferentialHistory() {
      return this.referentialHistory;
    },
  },
  actions: {
    async requestCoupons() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestCouponsHistory() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestCouponBanner() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestReferentialHistory() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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

    async createCoupon() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async createSenderCoupon() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async createReceiverCoupon() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async editCoupon() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async editCouponBanner() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async deleteCoupon() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

export const useOrdersStore = defineStore('ordersStore', {
  state: () => ({
    washesRequests: [],
  }),
  getters: {
    getWashesRequests() {
      return this.washesRequests;
    },
  },
  actions: {
    async requestWashes() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async filterWashes() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async selectDayWashes() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async washConfirm() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async changeWasher() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async cancelWash() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

export const useFinanceStore = defineStore('financeStore', {
  state: () => ({
    washes: [],
    autoPayment: {},
  }),
  getters: {
    getWashes() {
      return this.washes;
    },
    getAutoPayment() {
      return this.autoPayment;
    },
  },
  actions: {
    async requestWashes() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async requestAutoPayment() {
      // try {
      // axios
      //   .get(
      //     'http://127.0.0.1:3096/',
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
    async filterWashes() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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

    async sendPayment() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async editAutoPayment() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
    async downloadVoucher() {
      // try {
      // axios
      //   .post(
      //     'http://127.0.0.1:3096/',
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
