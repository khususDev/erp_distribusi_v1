import { ref } from 'vue'

// State global agar tetap sinkron antar komponen
const isExpanded = ref(true)
const isMobileOpen = ref(false)
const isHovered = ref(false)
const openSubmenu = ref(null) // Ini yang menyebabkan error tadi jika hilang

export function useSidebar() {
  const toggleSidebar = () => {
    isExpanded.value = !isExpanded.value
  }

  const toggleMobileSidebar = () => {
    isMobileOpen.value = !isMobileOpen.value
  }

  return {
    isExpanded,
    isMobileOpen,
    isHovered,
    openSubmenu,
    toggleSidebar,
    toggleMobileSidebar
  }
}