function FindProxyForURL(url, host) {
   if (url.substring(0, 5) == 'http:' || url.substring(0, 6) == 'https:') {
      return "HTTPS SERVER_CHANGE_ME:9999";
   }
   return "DIRECT";
}
