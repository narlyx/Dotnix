import { App } from "astal/gtk3";
import style from "./style.scss";
import Bar from "./widgets/bar";

App.start({
  css: style,
  main() {
    var monitors = App.get_monitors();
    monitors.map(Bar);
  },
});
