module servers.togaf.views.gbbs.delete_;

@safe:
import servers.togaf;

class DTGFGbbDeleteView : DMVCView {
  mixin(MVCViewThis!("TGFGbbDeleteView"));

  override void initialize() {
    super.initialize;
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFGbbDeleteView~":TGFGbbDeleteView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("GBBs -> Delete")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFGbbDeleteView", "DTGFGbbDeleteView"));
