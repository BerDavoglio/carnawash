/* eslint-disable prefer-destructuring */
/* eslint-disable import/prefer-default-export */
import { defineStore } from 'pinia';
import axios from 'axios';

import { toast } from 'vue3-toastify';

// FINISHED
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
    async login(email, password, func) {
      try {
        console.log('LOGIN');
        await axios
          .post('http://127.0.0.1:3096/jwt/', {
            email,
            password,
          })
          .then((response) => {
            this.token = response.data.token;
          })
          .then(() => {
            func('home');
          })
          .then(async () => {
            await this.requestPerfil();
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestPerfil() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/users',
            { headers: { Authorization: `Bearer ${this.token}` } },
          )
          .then((response) => {
            this.perfil = response.data;
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async updatePerfil(obj) {
      try {
        axios
          .put(
            'http://127.0.0.1:3096/users/',
            obj,
            { headers: { Authorization: `Bearer ${this.token}` } },
          )
          .then((response) => {
            toast.success('Perfil atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
            const [per, tok] = response.data;
            this.perfil = per;
            this.token = tok;
            window.location.reload();
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async logout(func) {
      try {
        this.token = '';
        this.role = '';
        func();
        return 0;
      } catch (error) {
        return error;
      }
    },
  },
  persist: true,
});

// FALTA DASHBOARD
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
    clientCar: [],
    clientWash: [],
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
    getClientCars() {
      return this.clientCar;
    },
    getClientWash() {
      return this.clientWash;
    },
  },
  actions: {
    async requestClients() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/users/admin/clients/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            console.log(response.data);
            this.clients = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestOneClient(id) {
      try {
        let returnData = {};
        axios
          .get(
            `http://127.0.0.1:3096/users/admin/clients/by-id/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => { returnData = response.data; })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return returnData;
      } catch (error) {
        return error;
      }
    },
    async requestClientCars(id) {
      try {
        axios
          .get(
            `http://127.0.0.1:3096/users/admin/clients/by-id/${id}/car/`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => { this.clientCar = response.data; })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestClientWash(id) {
      try {
        axios
          .get(
            `http://127.0.0.1:3096/users/admin/clients/by-id/${id}/wash/`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => { this.clientWash = response.data; })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestNewClients() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/users/admin/clients/new/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.newClients = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async createClient(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/users/admin/clients/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(() => {
            this.requestClients().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Client criado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async createClientCar(id, obj) {
      try {
        axios
          .post(
            `http://127.0.0.1:3096/users/admin/clients/by-id/${id}/car/`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(() => {
            this.requestClientCars(id);
          })
          .then(() => {
            toast.success('Carro criado com sucesso! Talvez seja necessário recarregar a página', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async updateClient(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/users/admin/clients/by-id/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(() => {
            this.requestClients();
          })
          .then(() => {
            toast.success('Cliente atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async updateClientCar(idClient, idCar, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/users/admin/clients/by-id/${idClient}/car/${idCar}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(() => {
            this.requestClientCar(idClient);
          })
          .then(() => {
            toast.success('Carro atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async deleteClient(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/users/admin/clients/by-id/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(() => {
            this.requestClients().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Cliente deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async deleteClientCar(idClient, idCar) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/users/admin/clients/by-id/${idClient}/car/${idCar}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(() => {
            this.requestClientCars(idClient).then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Carro deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
  },
  persist: true,
});

export const useWashersStore = defineStore('washerStore', {
  state: () => ({
    washers: [],
    infos: [],
    newWashers: 0,
    inactiveWashers: 0,
  }),
  getters: {
    getWashers() {
      return this.washers;
    },
    getInfos() {
      return this.infos;
    },
    getNewWashers() {
      return this.newWashers;
    },
    getInactiveWashers() {
      return this.inactiveWashers;
    },
  },
  actions: {
    async requestWashers() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/users/admin/washers/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.washers = response.data[0];
            this.infos = response.data[1];
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestOneWasher(id) {
      try {
        let returnData = {};
        axios
          .get(
            `http://127.0.0.1:3096/users/admin/washers/by-id/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => { returnData = response.data; })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return returnData;
      } catch (error) {
        return error;
      }
    },
    async requestNewWashers() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/users/admin/washers/new/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.newWashers = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestBankInfo(id) {
      try {
        axios
          .post(
            `http://127.0.0.1:3096/users/admin/washers/by-id/${id}/bank/`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestWashers();
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async createWasher(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/users/admin/washers/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestWashers();
          })
          .then(() => {
            toast.success('Washer criado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async editBankInfo(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/users/admin/washers/by-id/${id}/bank/`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestBankInfo(id);
          })
          .then(() => {
            toast.success('BankInfo atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editWasher(id, objWasher, objInfo) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/users/admin/washers/by-id/${id}`,
            {
              washer: objWasher,
              info: objInfo,
            },
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestWashers();
          })
          .then(() => {
            toast.success('Washer atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async changeApprovalWasher(id, change) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/users/admin/washers/by-id/${id}/approval/${change}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestWashers();
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async changeEnableWasher(id, change) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/users/admin/washers/by-id/${id}/enable/${change}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestWashers();
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async deleteWasher(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/users/admin/washers/by-id/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestWashers();
          })
          .then(() => {
            toast.success('Washer deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
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
      try {
        axios
          .get(
            'http://127.0.0.1:3096/users/admin/admins/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.admins = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestUserTypes() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/users/admin/usertype/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.userTypes = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async createAdmin(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/users/admin/admins/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestAdmins();
          })
          .then(() => {
            toast.success('Admin criado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async createUserType(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/users/admin/usertype/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestUserTypes();
          })
          .then(() => {
            toast.success('UserType criado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async editAdminRole(id, changedRole) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/users/admin/admins/role/${id}`,
            {
              role: changedRole,
            },
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestAdmins();
          })
          .then(() => {
            toast.success('AdminRole atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editAdminSubrole(id, changedSub) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/users/admin/admins/subrole/${id}`,
            {
              subrole: changedSub,
            },
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestAdmins();
          })
          .then(() => {
            toast.success('AdminSubrole atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editUserType(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/users/admin/usertype/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestAdmins();
          })
          .then(() => {
            toast.success('UserType atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async deleteAdmin(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/users/admin/admins/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(() => {
            this.requestAdmins();
          })
          .then(() => {
            toast.success('Admin deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async deleteUserType(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/users/admin/usertype/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(() => {
            this.requestUserTypes();
          })
          .then(() => {
            toast.success('UserType deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
  },
  persist: true,
});

// "FINISHED" DOWNLOAD
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
      try {
        axios
          .get(
            'http://127.0.0.1:3096/faq-terms/faq/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.faq = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestTerms() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/faq-terms/condition/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.terms = response.data.tems_conditions;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async createFAQ(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/faq-terms/faq/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestFAQs();
          })
          .then(() => window.location.reload())
          .then(() => {
            toast.success('FAQ criado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async editFAQ(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/faq-terms/faq/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestFAQs();
          })
          .then(() => window.location.reload())
          .then(() => {
            toast.success('FAQ atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editTerms(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/faq-terms/condition/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestTerms();
          })
          .then(() => window.location.reload())
          .then(() => {
            toast.success('Terms atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async deleteOneFAQ(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/faq-terms/faq/one/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestFAQs();
          })
          .then(() => window.location.reload())
          .then(() => {
            toast.success('FAQ deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async deleteAllFAQ() {
      try {
        axios
          .delete(
            'http://127.0.0.1:3096/faq-terms/faq/all',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestFAQs();
          })
          .then(() => window.location.reload())
          .then(() => {
            toast.success('FAQs deletados com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    // // FALTA FAZER DOWNLOADFILE
    // async downloadFileFaq() {
    //   // try {
    //   // axios
    //   //   .post(
    //   //     'http://127.0.0.1:3096/',
    //   //     obj,
    //   //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
    //   //   )
    //   //   .then((response) => {
    //   //      this.clients = response.data;
    //   //   })
    //   //     .catch((err) => {
    //   //       toast.error(err.response.data.errors, {
    //   //         autoClose: 5000,
    //   //         position: toast.POSITION.BOTTOM_RIGHT,
    //   //       });
    //   //     });
    //   //   return 0;
    //   // } catch (error) {
    //   //   return error;
    //   // }
    // },
    // // FALTA FAZER DOWNLOADFILE
    // async downloadFileTerms() {
    //   // try {
    //   // axios
    //   //   .post(
    //   //     'http://127.0.0.1:3096/',
    //   //     obj,
    //   //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
    //   //   )
    //   //   .then((response) => {
    //   //      this.clients = response.data;
    //   //   })
    //   //     .catch((err) => {
    //   //       toast.error(err.response.data.errors, {
    //   //         autoClose: 5000,
    //   //         position: toast.POSITION.BOTTOM_RIGHT,
    //   //       });
    //   //     });
    //   //   return 0;
    //   // } catch (error) {
    //   //   return error;
    //   // }
    // },
  },
  persist: true,
});

// "FINISHED" DOWNLOAD
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
      try {
        axios
          .get(
            'http://127.0.0.1:3096/quiz/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.quiz = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestAverage() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/quiz/respon/average/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.average = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestStatistics() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/quiz/respon/statistics/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.statistics = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async createQuiz(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/quiz/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestQuizes();
          })
          .then(() => window.location.reload())
          .then(() => {
            toast.success('Quiz criado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            console.log(err);
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async editQuiz(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/quiz/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestQuizes().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Quiz atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async deleteOneQuiz(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/quiz/one/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestQuizes();
          })
          .then(() => window.location.reload())
          .then(() => {
            toast.success('Quiz deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async deleteAllQuiz() {
      try {
        axios
          .delete(
            'http://127.0.0.1:3096/quiz/all',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestQuizes();
          })
          .then(() => window.location.reload())
          .then(() => {
            toast.success('Quizes deletados com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    // // FALTA FAZER DOWNLOADFILE
    // async downloadFile() {
    //   // try {
    //   // axios
    //   //   .post(
    //   //     'http://127.0.0.1:3096/',
    //   //     obj,
    //   //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
    //   //   )
    //   //   .then((response) => {
    //   //      this.clients = response.data;
    //   //   })
    //   //     .catch((err) => {
    //   //       toast.error(err.response.data.errors, {
    //   //         autoClose: 5000,
    //   //         position: toast.POSITION.BOTTOM_RIGHT,
    //   //       });
    //   //     });
    //   //   return 0;
    //   // } catch (error) {
    //   //   return error;
    //   // }
    // },
  },
  persist: true,
});

// FINISHED
export const useServicesStore = defineStore('servicesStore', {
  state: () => ({
    additional: [],
    size: [],
    additional_data: [],
    size_data: [],
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
    getAdditionalData() {
      return this.additional_data;
    },
    getSizeData() {
      return this.size_data;
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
      try {
        axios
          .get(
            'http://127.0.0.1:3096/services/additional',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.additional = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestSize() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/services/size',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.size = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestRegular() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/services/regular/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.regular = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestMarkup() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/services/markup/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.markup = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestAdditionalData() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/services/additional/number-used/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.additional_data = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestSizeData() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/services/size/number-used/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.size_data = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async createAdditional(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/services/additional',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestAdditional().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Additional criado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async createSize(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/services/size',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestSize().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Size criado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async createRegular(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/services/regular',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestRegular().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Regular criado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async editAdditional(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/services/additional/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestAdditional();
          })
          .then(() => {
            toast.success('Additional atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editSize(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/services/size/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestSize();
          })
          .then(() => {
            toast.success('Size atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editRegular(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/services/regular/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestRegular();
          })
          .then(() => {
            toast.success('Regular atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editMarkup(id, washer, carnawash) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/services/markup/${id}`,
            {
              washer_porcentage: washer,
              carnawash_porcentage: carnawash,
            },
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestMarkup();
          })
          .then(() => {
            toast.success('Markup atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async deleteAdditional(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/services/additional/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestAdditional().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Additional deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async deleteSize(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/services/size/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestSize().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Size deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async deleteRegular(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/services/regular/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestRegular().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Regular deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
  },
  persist: true,
});

export const useNotificationStore = defineStore('notificationStore', {
  state: () => ({
    notifications: [],
    notificationHistory: [],
    programmedNotification: {},
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
      try {
        axios
          .get(
            'http://127.0.0.1:3096/notification/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.notifications = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestNotificationHistory() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/notification/sent/all/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.notificationHistory = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestProgrammedNotification() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/notification/programmed/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.programmedNotification = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async createNotification(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/notification/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestNotification().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Notification criada com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async createSent(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/notification/sent/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestNotificationHistory().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('NotificationSent criada com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async editNotification(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/notification/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestNotification().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Notification atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editProgrammedNotification(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/notification/programmed/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestProgrammedNotification().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('ProgrammedNotification atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async deleteNotification(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/notification/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestNotification().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Notification deletada com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
  },
  persist: true,
});

// FINISHED
export const useCouponsStore = defineStore('couponsStore', {
  state: () => ({
    coupons: [],
    couponsHistory: [],
    couponBanner: {},
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
  },
  actions: {
    async requestCoupons() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/coupons/all/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.coupons = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestCouponsHistory() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/coupons/history/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.couponsHistory = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async requestCouponBanner() {
      try {
        axios
          .get(
            'http://127.0.0.1:3096/coupons/banner/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.couponBanner = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async createCoupon(obj) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/coupons/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestCoupons().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Coupon criada com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async createUniqueCoupon(obj, users) {
      try {
        axios
          .post(
            'http://127.0.0.1:3096/coupons/',
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async (response) => {
            await useNotificationStore.createSent({
              notification_id: response.id,
              user_type: users,
            });
          })
          .then(async () => {
            await this.requestCoupons();
          })
          .then(() => {
            toast.success('Coupon criada com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async editCoupon(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/coupons/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestCoupons().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Coupon atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editCouponBanner(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/coupons/banner/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestCouponBanner();
          })
          .then(() => {
            toast.success('CouponBanner atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    async deleteCoupon(id) {
      try {
        axios
          .delete(
            `http://127.0.0.1:3096/coupons/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestCoupons().then(() => window.location.reload());
          })
          .then(() => {
            toast.success('Coupon deletado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
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
      try {
        axios
          .get(
            'http://127.0.0.1:3096/schedule/all/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.washesRequests = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    // VERIFICAR SE PRECISA OU SE DA PRA FAZER PELO FRONT
    // async filterWashes() {
    //   // try {
    //   // axios
    //   //   .post(
    //   //     'http://127.0.0.1:3096/',
    //   //     obj,
    //   //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
    //   //   )
    //   //   .then((response) => {
    //   //      this.clients = response.data;
    //   //   })
    //   //     .catch((err) => {
    //   //       toast.error(err.response.data.errors, {
    //   //         autoClose: 5000,
    //   //         position: toast.POSITION.BOTTOM_RIGHT,
    //   //       });
    //   //     });
    //   //   return 0;
    //   // } catch (error) {
    //   //   return error;
    //   // }
    // },
    // // VERIFICAR SE PRECISA OU SE DA PRA FAZER PELO FRONT
    // async selectDayWashes() {
    //   // try {
    //   // axios
    //   //   .post(
    //   //     'http://127.0.0.1:3096/',
    //   //     obj,
    //   //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
    //   //   )
    //   //   .then((response) => {
    //   //      this.clients = response.data;
    //   //   })
    //   //     .catch((err) => {
    //   //       toast.error(err.response.data.errors, {
    //   //         autoClose: 5000,
    //   //         position: toast.POSITION.BOTTOM_RIGHT,
    //   //       });
    //   //     });
    //   //   return 0;
    //   // } catch (error) {
    //   //   return error;
    //   // }
    // },

    async washStart(id, washerId) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/schedule/admin/${id}`,
            {
              washer_id: washerId,
            },
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestWashes();
          })
          .then(() => {
            toast.success('Wash confirmada com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async cancelWash(id) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/schedule/admin/cancel/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestWashes();
          })
          .then(() => {
            toast.success('Wash cancelada com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
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
      try {
        axios
          .get(
            'http://127.0.0.1:3096/schedule/all/',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.washes = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async payedStatus() {
      try {
        let returnData = [];
        axios
          .get(
            'http://127.0.0.1:3096/payment/admin/pay-washer/all',
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => { returnData = response.data; })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return returnData;
      } catch (error) {
        return error;
      }
    },
    async requestAutoPayment(id) {
      try {
        axios
          .get(
            `http://127.0.0.1:3096/payment/auto-pay/${id}`,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then((response) => {
            this.autoPayment = response.data;
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    // // FALTA FAZER CÓDIGO
    // async filterWashes() {
    //   // try {
    //   // axios
    //   //   .post(
    //   //     'http://127.0.0.1:3096/',
    //   //     obj,
    //   //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
    //   //   )
    //   //   .then((response) => {
    //   //      this.clients = response.data;
    //   //   })
    //   //     .catch((err) => {
    //   //       toast.error(err.response.data.errors, {
    //   //         autoClose: 5000,
    //   //         position: toast.POSITION.BOTTOM_RIGHT,
    //   //       });
    //   //     });
    //   //   return 0;
    //   // } catch (error) {
    //   //   return error;
    //   // }
    // },

    async sendPayment(id, obj) {
      try {
        axios
          .post(
            `http://127.0.0.1:3096/payment/admin/pay-washer/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestWashes();
          })
          .then(() => {
            toast.success('Pagamento enviado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },
    async editAutoPayment(id, obj) {
      try {
        axios
          .put(
            `http://127.0.0.1:3096/payment/admin/auto-pay/${id}`,
            obj,
            { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
          )
          .then(async () => {
            await this.requestAutoPayment();
          })
          .then(() => {
            toast.success('Pagamento Automatico atualizado com sucesso!', {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          })
          .catch((err) => {
            toast.error(err.response.data.errors, {
              autoClose: 5000,
              position: toast.POSITION.BOTTOM_RIGHT,
            });
          });
        return 0;
      } catch (error) {
        return error;
      }
    },

    // // FALTA FAZER DOWNLOAD
    // async downloadVoucher() {
    //   // try {
    //   // axios
    //   //   .post(
    //   //     'http://127.0.0.1:3096/',
    //   //     obj,
    //   //     { headers: { Authorization: `Bearer ${useLoginStore().getToken}` } },
    //   //   )
    //   //   .then((response) => {
    //   //      this.clients = response.data;
    //   //   })
    //   //     .catch((err) => {
    //   //       toast.error(err.response.data.errors, {
    //   //         autoClose: 5000,
    //   //         position: toast.POSITION.BOTTOM_RIGHT,
    //   //       });
    //   //     });
    //   //   return 0;
    //   // } catch (error) {
    //   //   return error;
    //   // }
    // },
  },
  persist: true,
});
