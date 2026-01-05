<template>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      
      <!-- Navbar -->
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <ul class="navbar-nav mr-auto">
          <li>
            <a href="#" class="nav-link nav-link-lg">
              <i class="fas fa-bars"></i>
            </a>
          </li>
        </ul>
      </nav>

      <!-- Sidebar -->
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="#">ERP Distribusi</a>
          </div>
          <ul class="sidebar-menu">
            <li class="active">
              <a class="nav-link" href="/dashboard">
                <i class="fas fa-fire"></i>
                <span>Dashboard</span>
              </a>
            </li>
          </ul>
        </aside>
      </div>

      <!-- Content -->
      <div class="main-content">
        <section class="section">
          <slot />
        </section>
      </div>

      <!-- Footer -->
      <footer class="main-footer">
        <div class="footer-left">
          ERP Distribusi
        </div>
      </footer>

    </div>
  </div>
</template>
