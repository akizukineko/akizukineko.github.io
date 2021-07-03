{%- set valine_uri = theme.vendors.valine or '//unpkg.com/valine/dist/Valine.min.js' %}

<script>
NexT.utils.loadComments(document.querySelector('#valine-comments'), () => {
  NexT.utils.getScript('{{ valine_uri }}', () => {
    var GUEST = ['nick', 'mail', 'link'];
    var guest = '{{ theme.valine.guest_info }}';
    guest = guest.split(',').filter(item => {
      return GUEST.includes(item);
    });

    // 插入繁體中文文本
    var localeName = 'zh-TW', 
            localeMode = {
                head: {
                    nick: '暱稱',
                    mail: 'E-Mail',
                    link: '個人網站(http://)',
                },
                tips: {
                    comments: '留言',
                    sofa: '目前還沒有留言，成為第一個吧!',
                    busy: '伺服器忙碌中，請稍候...',
                    again: '輸入錯誤，請再試一次',
                    limit: '最多只能輸入 %d 個字！'
                },
                ctrl: {
                    reply: '回覆',
                    ok: 'OK',
                    sure: '沒錯',
                    cancel: '取消',
                    confirm: '確認',
                    continue: '繼續',
                    more: '讀取更多',
                    try: '請再試一次',
                    emoji: '表情符號',
                    preview: '留言預覽'
                },
                error: {
                    99: 'Initialization failed, Please check the `el` element in the init method.',
                    100: 'Initialization failed, Please check your appId and appKey.',
                    401: 'Unauthorized operation, Please check your appId and appKey.',
                    403: 'Access denied by api domain white list, Please check your security domain.',
                },
                timeago: {
                    seconds: '秒前',
                    minutes: '分鐘前',
                    hours: '小時前',
                    days: '天前',
                    now: '剛才'
                }
            };
    var valine = new Valine();

    // 安裝繁體中文文本
    valine.installLocale(localeName, localeMode)

    new Valine({
      el: '#valine-comments',
      verify: {{ theme.valine.verify }},
      notify: {{ theme.valine.notify }},
      appId: '{{ theme.valine.appid }}',
      appKey: '{{ theme.valine.appkey }}',
      placeholder: {{ theme.valine.placeholder | json }},
      avatar: '{{ theme.valine.avatar }}',
      meta: guest,
      pageSize: '{{ theme.valine.pageSize }}' || 10,
      visitor: {{ theme.valine.visitor }},
      lang: '{{ theme.valine.language }}' || 'zh-cn',
      path: location.pathname,
      recordIP: {{ theme.valine.recordIP }},
      serverURLs: '{{ theme.valine.serverURLs }}'
    });
  }, window.Valine);
});
</script>
