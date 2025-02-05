$(document).ready(function() {

    function favNote() {
        $(".fav-note").off('click').on('click', function(event) {
          event.stopPropagation();
          $(this).parents('.note-item').toggleClass('note-fav');
        })
    }

    function addLabelGroups() {
        $('.tags-selector .label-group-item').off('click').on('click', function(event) {
          event.preventDefault();
          /* Act on the event */
          var getclass = this.className;
          var getSplitclass = getclass.split(' ')[0];

          if ($(this).hasClass('common')) {
            $(this).parents('.note-item').removeClass('division');
            $(this).parents('.note-item').removeClass('franchise');
            $(this).parents('.note-item').removeClass('personnel');
            $(this).parents('.note-item').removeClass('system');
            $(this).parents('.note-item').removeClass('test');

            $(this).parents('.note-item').toggleClass(getSplitclass);
          } else if ($(this).hasClass('division')) {
            $(this).parents('.note-item').removeClass('common');
            $(this).parents('.note-item').removeClass('franchise');
            $(this).parents('.note-item').removeClass('personnel');
            $(this).parents('.note-item').removeClass('system');
            $(this).parents('.note-item').removeClass('test');

            $(this).parents('.note-item').toggleClass(getSplitclass);
          } else if ($(this).hasClass('franchise')) {
            $(this).parents('.note-item').removeClass('common');
            $(this).parents('.note-item').removeClass('division');
            $(this).parents('.note-item').removeClass('personnel');
            $(this).parents('.note-item').removeClass('system');
            $(this).parents('.note-item').removeClass('test');

            $(this).parents('.note-item').toggleClass(getSplitclass);
          } else if ($(this).hasClass('personnel')) {
            $(this).parents('.note-item').removeClass('common');
            $(this).parents('.note-item').removeClass('division');
            $(this).parents('.note-item').removeClass('franchise');
            $(this).parents('.note-item').removeClass('system');
            $(this).parents('.note-item').removeClass('test');

            $(this).parents('.note-item').toggleClass(getSplitclass);
          } else if ($(this).hasClass('system')) {
            $(this).parents('.note-item').removeClass('common');
            $(this).parents('.note-item').removeClass('division');
            $(this).parents('.note-item').removeClass('franchise');
            $(this).parents('.note-item').removeClass('personnel');
            $(this).parents('.note-item').removeClass('test');

            $(this).parents('.note-item').toggleClass(getSplitclass);
          } else if ($(this).hasClass('test')) {
            $(this).parents('.note-item').removeClass('common');
            $(this).parents('.note-item').removeClass('division');
            $(this).parents('.note-item').removeClass('franchise');
            $(this).parents('.note-item').removeClass('personnel');
            $(this).parents('.note-item').removeClass('system');

            $(this).parents('.note-item').toggleClass(getSplitclass);
          }
          
        });
    }

    $('.hamburger').on('click', function(event) {
        $('.app-note-container').find('.tab-title').toggleClass('note-menu-show')
        $('.app-note-container').find('.app-note-overlay').toggleClass('app-note-overlay-show')
    })
    $('.app-note-overlay').on('click', function(e){
        $(this).parents('.app-note-container').children('.tab-title').removeClass('note-menu-show')
        $(this).removeClass('app-note-overlay-show')
    })
    $('.tab-title .nav-pills a.nav-link').on('click', function(event) {
        $(this).parents('.app-note-container').find('.tab-title').removeClass('note-menu-show')
        $(this).parents('.app-note-container').find('.app-note-overlay').removeClass('app-note-overlay-show')
    })

    var $btns = $('.list-actions').click(function() {
        if (this.id == 'all-notes') {
          var $el = $('.' + this.id).fadeIn();
          $('#ct > div').not($el).hide();
        } if (this.id == 'important') {
          var $el = $('.' + this.id).fadeIn();
          $('#ct > div').not($el).hide();
        } else {
          var $el = $('.' + this.id).fadeIn();
          $('#ct > div').not($el).hide();
        }
        $btns.removeClass('active');
        $(this).addClass('active');  
    })


    favNote();
    addLabelGroups();
})
