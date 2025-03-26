// Copyright 2023 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Search the bookmarks when entering the search keyword.
// Get the bookmarks and display them in the popup
let currentId = '';
let currentTitle = '';
let currentUrl = '';
let isEdit = false;
const lang = navigator.language;
const icon = '<svg class="icon" style="width: 16px;height: 16px;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="24207"><path d="M115.4 386l18.8 32.8c16.6 29 43.8 50.4 76 59.6l115.8 33c34.4 9.8 58 41.2 58 77v79.8c0 22 12.4 42 32 51.8s32 29.8 32 51.8v78c0 31.2 29.8 53.8 59.8 45.2 32.2-9.2 57.2-35 65.4-67.6l5.6-22.4c8.4-33.8 30.4-62.8 60.6-80l16.2-9.2c30-17 48.4-49 48.4-83.4v-16.6c0-25.4-10.2-49.8-28.2-67.8l-7.8-7.8c-18-18-42.4-28.2-67.8-28.2H514c-22.2 0-44.2-5.8-63.6-16.8l-69-39.4c-8.6-5-15.2-13-18.4-22.4-6.4-19.2 2.2-40 20.4-49l11.8-6c13.2-6.6 28.6-7.8 42.6-3l46.4 15.4c16.4 5.4 34.4-0.8 43.8-15 9.4-14 8.4-32.6-2.4-45.6l-27.2-32.6c-20-24-19.8-59 0.6-82.6l31.4-36.6c17.6-20.6 20.4-50 7-73.4l-4.8-8.4c-7-0.4-13.8-0.6-20.8-0.6-185.6 0-343 121.8-396.4 290zM928 512c0-73.6-19.2-142.8-52.8-203L824 329.6c-31.4 12.6-47.6 47.6-37 79.6l33.8 101.4c7 20.8 24 36.6 45.2 41.8l58.2 14.6c2.4-18 3.6-36.4 3.6-55zM0 512a512 512 0 1 1 1024 0 512 512 0 1 1-1024 0z" p-id="24208"></path></svg>';
const deleteIcon = '<svg class="icon" style="width: 17px;height: 17px;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="18519"><path d="M776.704 290.901333H248.490667a44.629333 44.629333 0 0 0-44.373334 44.373334v389.973333a213.12 213.12 0 0 0 213.333334 213.333333h190.293333a213.12 213.12 0 0 0 213.333333-213.333333v-389.973333a44.373333 44.373333 0 0 0-44.373333-44.373334z m-233.088 471.466667a32 32 0 0 1-64 0v-172.8a32 32 0 0 1 64 0zM820.992 232.064H203.008a30.848 30.848 0 0 1 0-61.696h617.984a30.848 30.848 0 0 1 0 61.696z" fill="#999" p-id="18520"></path><path d="M593.92 228.992a30.848 30.848 0 0 1-30.848-30.805333 51.072 51.072 0 1 0-102.101333 0 30.848 30.848 0 1 1-61.696 0 112.768 112.768 0 1 1 225.493333 0 30.848 30.848 0 0 1-30.848 30.805333z" fill="#999" p-id="18521"></path></svg>';
const iconFolder = `<svg class="icon" style="width: 18px;height: 18px;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6643"><path d="M853.333333 256H469.333333l-85.333333-85.333333H170.666667c-46.933333 0-85.333333 38.4-85.333334 85.333333v170.666667h853.333334v-85.333334c0-46.933333-38.4-85.333333-85.333334-85.333333z" fill="#FFA000" p-id="6644"></path><path d="M853.333333 256H170.666667c-46.933333 0-85.333333 38.4-85.333334 85.333333v426.666667c0 46.933333 38.4 85.333333 85.333334 85.333333h682.666666c46.933333 0 85.333333-38.4 85.333334-85.333333V341.333333c0-46.933333-38.4-85.333333-85.333334-85.333333z" fill="#FFCA28" p-id="6645"></path></svg>`
const addFolder = `<svg class="icon" style="width: 18px;height: 18px;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="14491"><path d="M832 300.8h-298.666667L421.12 165.12a42.666667 42.666667 0 0 0-32.853333-15.786667H192A105.386667 105.386667 0 0 0 85.333333 253.013333v517.973334a105.386667 105.386667 0 0 0 106.666667 103.68h640a105.386667 105.386667 0 0 0 106.666667-103.68V404.48a105.386667 105.386667 0 0 0-106.666667-103.68zM597.333333 640h-42.666666v42.666667a42.666667 42.666667 0 0 1-85.333334 0v-42.666667h-42.666666a42.666667 42.666667 0 0 1 0-85.333333h42.666666v-42.666667a42.666667 42.666667 0 0 1 85.333334 0v42.666667h42.666666a42.666667 42.666667 0 0 1 0 85.333333z" fill="#999" p-id="14492"></path></svg>`;
const delFolder = `<svg class="icon" style="width: 18px;height: 18px;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="15220"><path d="M832 300.8h-298.666667L421.12 165.12a42.666667 42.666667 0 0 0-32.853333-15.786667H192A105.386667 105.386667 0 0 0 85.333333 253.013333v517.973334a105.386667 105.386667 0 0 0 106.666667 103.68h640a105.386667 105.386667 0 0 0 106.666667-103.68V404.48a105.386667 105.386667 0 0 0-106.666667-103.68zM597.333333 640h-170.666666a42.666667 42.666667 0 0 1 0-85.333333h170.666666a42.666667 42.666667 0 0 1 0 85.333333z" fill="#999" p-id="15221"></path></svg>`;
const editIcon = `<svg class="icon" style="width: 16px;height: 16px;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7423"><path d="M711.04 85.76A227.114667 227.114667 0 0 1 878.549333 145.066667a229.589333 229.589333 0 0 1 59.690667 167.936v398.08a229.248 229.248 0 0 1-59.264 167.936 228.138667 228.138667 0 0 1-167.936 59.264h-398.08A227.498667 227.498667 0 0 1 145.024 878.933333a227.498667 227.498667 0 0 1-59.264-167.936v-398.08A227.498667 227.498667 0 0 1 145.066667 145.024 227.498667 227.498667 0 0 1 312.96 85.76h398.08z m-242.517333 632.96l286.848-287.701333c26.026667-26.453333 26.026667-69.034667 0-95.061334l-55.381334-55.381333a67.413333 67.413333 0 0 0-95.488 0l-28.586666 28.970667c-4.266667 4.266667-4.266667 11.52 0 15.786666 0 0 67.797333 67.328 69.077333 69.034667 4.693333 5.12 7.68 11.946667 7.68 19.626667 0 15.317333-12.373333 28.117333-28.16 28.117333-7.253333 0-14.08-2.986667-18.773333-7.68L534.613333 363.690667a9.258667 9.258667 0 0 0-12.8 0l-203.306666 203.306666c-14.08 14.08-22.186667 32.810667-22.613334 52.821334l-2.56 101.034666c0 5.546667 1.706667 10.666667 5.546667 14.506667 3.84 3.84 8.96 5.973333 14.506667 5.973333h100.138666c20.48 0 40.106667-8.106667 55.04-22.613333z" fill="#999" p-id="7424"></path></svg>`;
const copyIcon = `<svg class="icon" style="width: 1em;height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6332"><path d="M469.333333 832h243.2A169.728 169.728 0 0 1 554.666667 938.666667H256a170.666667 170.666667 0 0 1-170.666667-170.666667v-341.333333a170.965333 170.965333 0 0 1 149.333334-169.386667V597.333333a235.093333 235.093333 0 0 0 234.666666 234.666667z m362.666667-565.333333h90.453333a69.888 69.888 0 0 0-8.96-10.666667L768 110.506667a49.322667 49.322667 0 0 0-10.666667-8.533334V192a75.008 75.008 0 0 0 74.666667 74.666667z m0 64a138.922667 138.922667 0 0 1-138.666667-138.666667V85.333333H469.333333a170.666667 170.666667 0 0 0-170.666666 170.666667v341.333333a170.666667 170.666667 0 0 0 170.666666 170.666667h298.666667a170.666667 170.666667 0 0 0 170.666667-170.666667V330.666667z" fill="#999" p-id="6333"></path></svg>`
$('#searchInput').on('change', (event) => {
  const searchKeyword = event.target.value;
  const bookmarkList = $('#bookmarkList');
  if(searchKeyword != '') {
    chrome.bookmarks.search(searchKeyword, (bookmarks) => {
      bookmarkList.empty();
      displayBookmarks(bookmarks, bookmarkList, 0, true);
      bindEvents();
    });
  }else {
    chrome.bookmarks.getTree((tree) => {
      bookmarkList.empty();
      displayBookmarks(tree[0].children, bookmarkList, 0, true);
      bindEvents();
    });
  }
});
$('.search-help').on('click', () => {
  $('#searchInput').focus();
});
// chrome.bookmarks.getRecent((tree) => {
//   console.log(tree)
// });
chrome.bookmarks.getTree((tree) => {
  const bookmarkList = $('#bookmarkList');
  displayBookmarks(tree[0].children, bookmarkList, 0);
  bindEvents();
});

// Recursively display the bookmarks
async function displayBookmarks(nodes, parentNode , level, show) {
  for (const node of nodes) {
    // If the node is a bookmark, create a list item and append it to the parent node
    if (node.url) {
      let icoUrl = '';
      if(node.url.includes('http')) {
        icoUrl = `http://${new URL(node.url).hostname}/favicon.ico`;
      }
      if(node.url.includes('http') || node.url.includes('https')) {        
        icoUrl = `https://${new URL(node.url).hostname}/favicon.ico`;
      }
      let listItem = renderBookmark(node, level, show);
      // const img = new Image();
      // img.src = icoUrl;
      // img.onerror = () => {
      //   listItem = `<li class="${show?'':'hidden'}"><a style="padding-left: ${(level-1) * 10}px;" class="bookmark-item" href="${node.url}" target="_blank" title="${node.title}"><span style="margin-right: 5px;margin-left: 5px;">${icon}</span> ${node.title}</a>`;
      //   parentNode.append(listItem);
      // }      
      // img.onload = () => {
      //   console.log(1);        
      //   listItem = `<li class="${show?'':'hidden'}"><a style="padding-left: ${(level-1) * 10}px;" class="bookmark-item" href="${node.url}" target="_blank" title="${node.title}"><img style="width: 16px;height: 16px;vertical-align: middle;margin-right: 5px;margin-left: 5px;" src="${icoUrl}"> <span>${node.title}</span></a>`;
      //   parentNode.append(listItem);
      // }
      parentNode.append(listItem);
      // await imgLoad(node, parentNode, level, show);
    }

    // If the node has children, recursively display them
    if (node.children) {      
      const sublist = renderFolder(node, level);
      parentNode.append(sublist);
      if(level > 1) $(sublist).addClass('hidden');
      displayBookmarks(node.children, $(sublist), level + 1, show);
    }
  }
}

function imgLoad(node, parentNode,level, show) {
  let icoUrl = '';
  if(node.url.includes('http')) {
    icoUrl = `http://${new URL(node.url).hostname}/favicon.ico`;
  }
  if(node.url.includes('http') || node.url.includes('https')) {        
    icoUrl = `https://${new URL(node.url).hostname}/favicon.ico`;
  }
  let listItem = '';
  
  return new Promise((resolve, reject) => {
    const img = new Image();
    img.src = icoUrl;
    img.onerror = () => {
      resolve(true);
      listItem = `<li class="${show?'':'hidden'}"><a style="padding-left: ${(level-1) * 10}px;" class="bookmark-item" href="${node.url}" target="_blank" title="${node.title}"><span style="margin-right: 5px;margin-left: 5px;">${icon}</span> ${node.title}</a>`;
      parentNode.append(listItem);
    }      
    img.onload = () => {
      resolve(true);     
      listItem = `<li class="${show?'':'hidden'}"><a style="padding-left: ${(level-1) * 10}px;" class="bookmark-item" href="${node.url}" target="_blank" title="${node.title}"><img style="width: 16px;height: 16px;vertical-align: middle;margin-right: 5px;margin-left: 5px;" src="${icoUrl}"> <span>${node.title}</span></a>`;
      parentNode.append(listItem);
    }
  });
}

function noScroll() {
  $('html').css('overflow', 'hidden');
  $('body').css('overflow', 'hidden');
}

function bindEvents () {
  // 折叠文件夹
  $('.top-title').on('click', function(event) {
    event.stopPropagation();
    $(this).siblings('li').toggleClass('hidden');
    $(this).siblings('ul').toggleClass('hidden');
    $(this).parent('ul').siblings('ul').find('li').addClass('hidden');
    $(this).parent('ul').siblings('ul').find('ul').addClass('hidden');
  });
  // 新增文件夹操作
  $('.add-folder').on('click', function(event) {
    $('.w-input').val('');
    event.stopPropagation();
    currentId = this.getAttribute('data-id');
    currentTitle = this.getAttribute('data-title');
    isEdit = false;
    $('.fixed-window').removeClass('hidden');
    $('.mark-modal').removeClass('hidden');
    noScroll();
  });
  // 删除文件夹操作
  $('.remove-folder').on('click', function(event) {
    event.stopPropagation();
    currentId = this.getAttribute('data-id');
    currentTitle = this.getAttribute('data-title');
    $('.mark-modal').removeClass('hidden');
    noScroll();
    if($(this).parents('h3').siblings('li').length > 0) {
      $('.fixed-window-error').removeClass('hidden').find('.w-error').html("Can't remove non-empty folder")
    }else{
      $('.fixed-window-confirm').removeClass('hidden');
      $('.tip-content').html(`<div>“${currentTitle.length>26?currentTitle.substring(0, 26)+'...':currentTitle}” will be deleted.</div>`);
    }
  });
  // 删除书签操作
  $('.remove-url').on('click', function(event) {
    const $a = $(this).parents('.edit-url-box').siblings('.bookmark-item');
    event.stopPropagation();
    currentId = $a.attr('data-id');
    currentTitle = $a.attr('title');
    $('.tip-content').html(`<div>“${currentTitle.length>26?currentTitle.substring(0, 26)+'...':currentTitle}” will be deleted.</div>`);
    $('.fixed-window-confirm').removeClass('hidden');
  });
  // 编辑文件夹名称
  $('.rename-folder').on('click', function(event) {
    event.stopPropagation();
    currentId = this.getAttribute('data-id');
    currentTitle = this.getAttribute('data-title');
    $('.fixed-window').removeClass('hidden');
    $('.mark-modal').removeClass('hidden');
    $('.w-input').val(currentTitle);
    isEdit = true;
    noScroll();
  });
  // 改变svg的颜色
  $('.edit-url,.rename-folder').on('mouseenter', function(event) {
    $(this).find('path').attr('fill', '#0B57D0');
  });
  $('.remove-url,.remove-folder').on('mouseenter', function(event) {
    $(this).find('path').attr('fill', '#E40D0D');
  });
  $('.copy-url').on('mouseenter', function(event) {
    $(this).find('path').attr('fill', '#00A82D');
  });
  $('.add-folder').on('mouseenter', function(event) {
    $(this).find('path').attr('fill', '#FBC117');
  });
  
  $('.edit-url,.remove-url,.copy-url,.add-folder,.remove-folder,.rename-folder').on('mouseleave', function(event) {
    $(this).find('path').attr('fill', '#999');
  });
  // 编辑书签信息
  $('.edit-url').on('click', function(event) {
    const $a = $(this).parents('.edit-url-box').siblings('.bookmark-item');
    event.stopPropagation();
    currentId = $a.attr('data-id');
    currentTitle = $a.attr('title');
    currentUrl = $a.attr('href');
    
    $('.w-input-title').val(currentTitle);
    $('.w-textarea').val(currentUrl);
    $('.fixed-window-edit-url').removeClass('hidden');
    $('.mark-modal').removeClass('hidden');
    noScroll();
  });
  // 复制到粘贴板
  $('.copy-url').on('click', function(event) {
    event.stopPropagation();
    const $a = $(this).parents('.edit-url-box').siblings('.bookmark-item');
    currentUrl = $a.attr('href');
    copyToClipboard(currentUrl);
  });

  // 确认删除弹窗
  $('.w-confirm-del').on('click', () => {
    $('.fixed-window-success').removeClass('hidden');
    $('.fixed-window-confirm').addClass('hidden');
    $('.mark-modal').addClass('hidden');
    chrome.bookmarks.remove(currentId, () => {
      setTimeout(() => {
        $('.fixed-window-success').addClass('hidden');
        $('#item-'+currentId).remove();
        // location.reload();
      }, 600);
    });
  })
  // 确认新增文件夹弹窗
  $('.w-confirm').on('click', (event) => {
    $('.fixed-window').addClass('hidden');
    $('.mark-modal').addClass('hidden');
    if(!$('.w-input').val()) {
      $('.fixed-window-error').removeClass('hidden').find('.w-error').html("input value is empty");
    }else{
      if(!isEdit) {
        $('.fixed-window-success').removeClass('hidden');
        // 新增目录
        const title = $('.w-input').val().toString();
        const level = $('#item-'+currentId).attr('level');
        chrome.bookmarks.create({
          parentId: currentId.toString(),
          title
          }, (bookmark) => {setTimeout(() => {
            $('.fixed-window-success').addClass('hidden');
            $('#item-'+currentId).siblings().removeClass('hidden').last().after(renderFolder(bookmark, Number(level)+1));
            // location.reload();
          }, 600);
        });
      }else{
        $('.fixed-window-success').removeClass('hidden');
        // 更新目录
        chrome.bookmarks.update(currentId.toString(), {title: $('.w-input').val().toString()}, () => {
          $('.mark-modal').addClass('hidden');
          setTimeout(() => {
            $('.fixed-window-success').addClass('hidden');
            $('#item-'+currentId).find('.node-title').html($('.w-input').val().toString());
            $('#item-'+currentId).find('.rename-folder').attr('data-title', $('.w-input').val().toString());
          }, 600);
        });
      }
    }
  });
  // 更新书签信息
  $('.w-confirm-url').on('click', function() {
    $('.fixed-window-edit-url').addClass('hidden');
    if ($('.w-input-title').val().toString() === '') {
      $('.fixed-window-error').removeClass('hidden').find('.w-error').html("Bookmark name cannot be empty");
    }
    if ($('.w-textarea').val().toString() === '') {
      $('.fixed-window-error').removeClass('hidden').find('.w-error').html("Bookmark address cannot be empty");
    }
    if ($('.w-input-title').val().toString() !== '' && $('.w-textarea').val().toString() !== '') {      
      $('.fixed-window-success').removeClass('hidden');
      const title = $('.w-input-title').val().toString();const url = $('.w-textarea').val().toString();
      chrome.bookmarks.update(currentId.toString(), {title, url}, () => {
        $('#item-'+currentId).find('.bookmark-item').attr('href', url).attr('title', title).find('.node-title').html(title);
        $('.mark-modal').addClass('hidden');
        setTimeout(() => {
          $('.fixed-window-success').addClass('hidden');
        }, 600);
      });
    }
  });
  // 隐藏弹窗
  $('.w-cancel').on('click', (event) => {
    $('.fixed-window').addClass('hidden');
    $('.fixed-window-edit-url').addClass('hidden');
    $('.fixed-window-confirm').addClass('hidden');
    $('.fixed-window-success').addClass('hidden');
    $('.fixed-window-error').addClass('hidden');
    $('.mark-modal').addClass('hidden');
    $('html').css('overflow', 'inherit');
    $('body').css('overflow', 'inherit');
  });
}
// $(document).on('contextmenu', function(e) {
//     // 阻止默认的上下文菜单显示
//     e.preventDefault();
    
//     // 这里可以添加你的代码来处理鼠标右键点击事件
    
//     // 可以返回 false 来阻止默认行为，或者使用 e.preventDefault()
//     return false;
//     // chrome.contextMenus.removeAll();
// });
var byId = function (id) { return document.getElementById(id); }
// Sortable.create(byId('bookmarkList'), {
//   group: "words",
//   animation: 150,
//   store: {
//     get: function (sortable) {
//       var order = localStorage.getItem(sortable.options.group);
//       return order ? order.split('|') : [];
//     },
//     set: function (sortable) {
//       var order = sortable.toArray();
//       localStorage.setItem(sortable.options.group, order.join('|'));
//     }
//   },
//   onAdd: function (evt){ console.log('onAdd.foo:', [evt.item, evt.from]); },
//   onUpdate: function (evt){ console.log('onUpdate.foo:', [evt.item, evt.from]); },
//   onRemove: function (evt){ console.log('onRemove.foo:', [evt.item, evt.from]); },
//   onStart:function(evt){ console.log('onStart.foo:', [evt.item, evt.from]);},
//   onSort:function(evt){ console.log('onStart.foo:', [evt.item, evt.from]);},
//   onEnd: function(evt){ console.log('onEnd.foo:', [evt.item, evt.from]);}
// });

// 添加文件夹渲染dom
function renderFolder(node,level) {
  const sublist = document.createElement('ul');
  sublist.innerHTML = `<h3 class="top-title" level="${level}" id="item-${node.id}" style="display: flex;justify-content: space-between;align-items: center;">
    <div style="margin-left: ${(level>1?(level-1)*10:0)}px;">
      <span style="cursor: pointer;">${level != 0 ? iconFolder : ''}</span> 
      <span class="node-title" style="${level != 0?'font-size: 12px;font-weight: normal;cursor: pointer;':'font-size: 17px;cursor: pointer;'}">${node.title}</span>
    </div>
    <div class="top-title-right">
      <span title="Rename folder" class="${level != 0?'rename-folder':'hidden'}" style="cursor: pointer;overflow: hidden;" data-id="${node.id}" data-title="${node.title}">${editIcon}</span>
      <span title="Add folders" class="add-folder" style="cursor: pointer;overflow: hidden;" data-id="${node.id}" data-title="${node.title}">${addFolder}</span>
      <span title="Delete folders" class="${level != 0?'remove-folder':'hidden'}" style="cursor: pointer;overflow: hidden;" data-id="${node.id}" data-title="${node.title}">${delFolder}</span>      
    </div>
  </h3>`;
  return sublist;
}
// 添加书签渲染dom
function renderBookmark(node, level, show) {
  const listItem = `<li class="${show?'directory':'hidden directory'}" id="item-${node.id}">
    <div style="overflow: hidden;display: flex;justify-content: space-between;align-items: center;">
      <a style="padding-left: ${(level-1) * 10}px;" class="bookmark-item" href="${node.url}" target="_blank" title="${node.title}" data-id="${node.id}">
        <span style="margin-right: 5px;margin-left: 5px;">${icon}</span>
        <span class="node-title">${node.title}</span>
      </a>
      <div class="edit-url-box" style="line-height: 30px;overflow: hidden;margin-right: 4px;">
        <span class="edit-url" style="cursor: pointer;" title="Edit url">${editIcon}</span>
        <span class="remove-url" style="cursor: pointer;" title="Delete url">${deleteIcon}</span>
        <span class="copy-url" style="cursor: pointer;" title="Copy url">${copyIcon}</span>
      </div>
    </div>        
  </li>`;
  return listItem;
}
// 粘贴板
function copyToClipboard(text) {
  navigator.clipboard.writeText(text)
    .then(() => {
      // console.log('Text copied to clipboard');
      $('.fixed-window-success').removeClass('hidden');
      setTimeout(() => {
        $('.fixed-window-success').addClass('hidden');
      }, 600);
    })
    .catch(err => {
      // console.error('Failed to copy text: ', err);
      $('.fixed-window-error').removeClass('hidden').find('.w-error').html(`Failed to copy text: ${err}`);
    });
}
function checkPageAvailability(url) {
  fetch(url)
    .then(response => {
      if (response.ok) {
        console.log('Page is available:', url);
      } else {
        console.error('Page is not available or returned an error:', url);
      }
    })
    .catch(error => {
      console.error('Failed to check the page:', url, error);
    });
}

// 使用方法
// checkPageAvailability('https://www.example231321313131.com');
