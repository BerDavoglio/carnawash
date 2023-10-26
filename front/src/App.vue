<template>
  <div class="app">
    <sidebar-menu theme="white-theme"
                  :menu="menu"
                  @update:collapsed="onToggleCollapse"
                  v-if="currentRouteName != 'login'">
      <template v-slot:toggle-icon>
        <div className="w-9 h-9 rounded-full bg-amber-400 flex">
          <div className="m-auto">
            <v-icon name="md-arrowback"
                    fill="white" />
          </div>
        </div>
      </template>
      <template v-slot:header>
        <div v-show="!isClosed">
          <img className="m-auto mb-10 h-[80px]"
               src="../public/assets/img/brand-logo.png"
               alt="" />
          <div className="h-[0.5px] w-[90%] mx-auto bg-[#C9C9C9]" />
        </div>
      </template>
      <template v-slot:footer>
        <div className="h-[0.5px] w-[90%] mx-auto bg-[#C9C9C9]" />
        <!-- eslint-disable-next-line vuejs-accessibility/click-events-have-key-events -->
        <div v-show="!isClosed"
             @click="goPage('login')"
             className="text-[16px] ml-[40px] my-[28px]
             cursor-pointer">
          <v-icon name="md-logout"
                  fill="#EDBD3A"
                  scale="1.25" />
          Log out
        </div>
      </template>
    </sidebar-menu>
    <router-view :className="['max-w-[1920px] '
      + (currentRouteName != 'login'
      ? (!isClosed ? 'ml-[300px] mr-[50px] my-20 ' : 'ml-[100px] mr-[50px] my-20 ') : ''),
    ]" />
  </div>
</template>

<script>

export default {
  name: 'App',
  components: {},
  data() {
    return {
      menu: [
        {
          href: '/',
          title: 'Dashboard',
          icon: 'fa fa-house',
        },
        {
          href: '/orders/',
          title: 'Orders and Appontments',
          icon: 'fa fa-calendar-days',
        },
        {
          href: '/services/',
          title: 'Services',
          icon: 'fa fa-car',
        },
        {
          href: '/coupons/',
          title: 'Coupons and Promotions',
          icon: 'fa fa-tag',
        },
        {
          href: '/reports/',
          title: 'Reports',
          icon: 'fa-brands fa-trello',
        },
        {
          href: '/management/',
          title: 'User Management',
          icon: 'fa fa-users',
        },
        // {
        //   href: '/products/',
        //   title: 'Products',
        //   icon: 'fa fa-cart-shopping',
        // },
        {
          href: '/training/',
          title: 'Washers Quiz and Training',
          icon: 'fa fa-file-lines',
        },
        {
          href: '/finance/',
          title: 'Finance',
          icon: 'fa fa-dollar-sign',
        },
        {
          href: '/notifications/',
          title: 'Notifications',
          icon: 'fa fa-circle-exclamation',
        },
        {
          href: '/faq/',
          title: 'FAQ & Terms and Conditions',
          icon: 'fa-regular fa-file',
        },
        {
          href: '/account/',
          title: 'My Account',
          icon: 'fa fa-user',
        },
      ],
      isClosed: false,
    };
  },
  methods: {
    onToggleCollapse() {
      this.isClosed = !this.isClosed;
    },
    goPage(route) {
      this.$router.push({ name: route });
    },
  },
  computed: {
    currentRouteName() {
      return this.$route.name;
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}

.v-sidebar-menu .vsm--toggle-btn {
  order: -1;
  justify-content: right;
  padding-right: 10px;
}

.v-sidebar-menu.vsm_white-theme .vsm--toggle-btn {
  background-color: white;
}

.v-sidebar-menu .vsm--item {
  width: 90%;
  margin: 5.5px auto;
}

.v-sidebar-menu.vsm_white-theme .vsm--link .vsm--icon {
  color: #EDBD3A;
  background-color: #fff;
  height: 24px;
}

.v-sidebar-menu.vsm_white-theme .vsm--link_level-1.vsm--link_active .vsm--icon {
  color: #000;
  background-color: #EDBD3A;
  height: 24px;
}

.v-sidebar-menu.vsm_white-theme .vsm--link_level-1.vsm--link_active {
  background-color: #EDBD3A;
  box-shadow: none;
  height: 24px;
  padding-top: 24px;
  padding-bottom: 24px;
  border-radius: 10px;
}

.v-sidebar-menu .vsm--link {
  font-size: 16px;
}

.v-sidebar-menu .vsm--link_active {
  font-weight: 500;
  font-size: 16px;
}

.v-sidebar-menu .vsm-arrow:after {
  font-family: FontAwesome
}

.v-sidebar-menu .collapse-btn:after {
  content: "\f07e";
  font-family: FontAwesome;
}
</style>
