final: prev: {
  jetbrains.pycharm-community = prev.jetbrains.pycharm-community.override {
    jdk = final.jdk21;
  };
  jetbrains.datagrip = prev.jetbrains.datagrip.override {
    jdk = final.jdk21;
  };
}
