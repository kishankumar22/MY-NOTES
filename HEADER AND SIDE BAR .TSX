'use client';

import React, { useEffect, useRef, useState } from 'react';
import { useAuth } from '../hooks/useAuth';
import axiosInstance from '../lib/axios';
import { useRouter } from 'next/navigation';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {
  faUser,
  faSignOutAlt,
  faCog,
  faChevronDown,
} from '@fortawesome/free-solid-svg-icons';

const Header = () => {
  const { user, loading } = useAuth();
  const router = useRouter();
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  const handleLogout = async () => {
    try {
      await axiosInstance.post('/api/auth/logout');
    } catch (error) {
      console.error('Logout failed', error);
    } finally {
      router.push('/login');
    }
  };

  const handleClickOutside = (event: MouseEvent) => {
    if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
      setDropdownOpen(false);
    }
  };

  useEffect(() => {
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  return (
    <header className="bg-gradient-to-r from-gray-800 to-gray-900 text-white shadow-md px-6 py-3 flex justify-end items-center z-40 relative">
      {/* Logo or title (Optional) */}
      

      {/* User Dropdown */}
      <div className="relative" ref={dropdownRef}>
        <button
          onClick={() => setDropdownOpen((prev) => !prev)}
          className="flex items-center gap-2 px-3 py-2 bg-gray-700 hover:bg-gray-600 rounded-full text-white text-sm font-medium shadow-sm transition-all"
        >
          <FontAwesomeIcon icon={faUser} className="w-4 h-4" />
          {loading ? 'Loading...' : user?.name || 'Guest'}
          <FontAwesomeIcon icon={faChevronDown} className="w-3 h-3" />
        </button>

        {dropdownOpen && (
          <div className="absolute right-0 mt-3 w-52 bg-gray-200 text-gray-800 border border-gray-200 shadow-xl rounded-md overflow-hidden z-50 animate-fade-in-down">
            <button
              onClick={() => router.push('/account')}
              className="w-full flex items-center gap-2 px-4 py-2 text-sm hover:bg-gray-100 transition"
            >
              <FontAwesomeIcon icon={faCog} className="text-blue-500 w-4 h-4" />
              Account Settings
            </button>
            <button
              onClick={handleLogout}
              className="w-full flex items-center gap-2 px-4 py-2 text-sm text-red-600 hover:bg-red-50 transition"
            >
              <FontAwesomeIcon icon={faSignOutAlt} className="w-4 h-4" />
              Logout
            </button>
          </div>
        )}
      </div>
    </header>
  );
};

export default Header;
----------------------------------------------------
'use client';

import { useState } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {
  faUsers,
  faLayerGroup,
  faTasks,
  faFileAlt,
  faBars,
  faTimes,
  faTasksAlt,
} from '@fortawesome/free-solid-svg-icons';
import { faDashboard } from '@fortawesome/free-solid-svg-icons/faDashboard';

export default function Sidebar() {
  const [isOpen, setIsOpen] = useState(false);
  const pathname = usePathname();

  const navItems = [
    { name: 'Dashboard', path: '/admin', icon: faDashboard },
    { name: 'Manage User', path: '/admin/user', icon: faUsers },
    { name: 'Manage Team', path: '/admin/team', icon: faLayerGroup },
    { name: 'Manage Task', path: '/admin/task', icon: faTasksAlt },
    { name: 'Task Assignment', path: '/admin/task-assignment', icon: faTasks },
    { name: 'View Logs', path: '/admin/view-logs', icon: faFileAlt },
  ];

  const toggleSidebar = () => setIsOpen(!isOpen);

  return (
    <>
      {/* Hamburger Button */}
      <button
  onClick={toggleSidebar}
  className="md:hidden fixed top-3 left-4 z-50 p-2 bg-blue-600 hover:bg-blue-700 text-white rounded-full shadow-md"
>
  <FontAwesomeIcon icon={isOpen ? faTimes : faBars} className="w-5 h-5" />
</button>


      {/* Sidebar */}
      <aside
        className={`fixed top-0 left-0 h-full w-60 bg-gradient-to-b from-gray-900 via-gray-800 to-gray-900 text-white shadow-2xl transform transition-transform duration-300 ease-in-out
        ${isOpen ? 'translate-x-0' : '-translate-x-full'} md:translate-x-0 z-30`}
      >
        <div className="flex flex-col h-full">
          {/* Brand */}
          <div className="flex items-center justify-center h-15 border-b border-gray-700">
            <h1 className="text-xl font-bold tracking-wide text-white">Task Manager</h1>
          </div>

          {/* Nav */}
          <nav className="flex-1 overflow-y-auto px-2 py-4">
            <ul className="space-y-2">
              {navItems.map((item) => {
                const isActive = pathname === item.path;

                return (
                  <li key={item.path}>
                    <Link
                      href={item.path}
                      onClick={() => setIsOpen(false)}
                      className={`flex items-center gap-4 px-4 py-2 rounded-lg relative group transition-all duration-200
                        ${
                          isActive
                            ? 'bg-blue-600 text-white font-medium shadow-lg'
                            : 'hover:bg-gray-700/70 hover:text-white text-gray-300'
                        }`}
                    >
                      {/* Active indicator */}
                      {isActive && (
                        <span className="absolute left-0 top-0 h-full w-1 bg-blue-400 rounded-r-md" />
                      )}
                      <FontAwesomeIcon
                        icon={item.icon}
                        className={`w-4 h-4 transition-transform duration-200 group-hover:scale-110 ${
                          isActive ? 'text-white' : 'text-blue-400'
                        }`}
                      />
                      <span className="text-sm">{item.name}</span>
                    </Link>
                  </li>
                );
              })}
            </ul>
          </nav>

          {/* Footer */}
          <div className="px-4 py-3 text-xs text-gray-500 border-t border-gray-700">
            © 2025 Task Manager
          </div>
        </div>
      </aside>

      {/* Overlay */}
      {isOpen && (
        <div
          className="fixed inset-0 bg-black/40 backdrop-blur-sm md:hidden z-20 transition-opacity duration-300"
          onClick={toggleSidebar}
        />
      )}
    </>
  );
}
-----------------------------------------------------------------------------------------
@layer utilities {
  .animate-fade-in-down {
    animation: fadeInDown 0.3s ease-out;
  }

  @keyframes fadeInDown {
    0% {
      opacity: 0;
      transform: translateY(-0.25rem);
    }
    100% {
      opacity: 1;
      transform: translateY(0);
    }
  }
}
