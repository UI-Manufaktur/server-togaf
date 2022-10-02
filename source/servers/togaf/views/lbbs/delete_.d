module servers.togaf.views.lbbs.delete_;

@safe:
import servers.togaf;

class DTGFLbbDeleteView : DMVCView {
  mixin(MVCViewThis!("TGFLbbDeleteView"));

  override void initialize() {
    super.initialize;
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFLbbDeleteView~":TGFLbbDeleteView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("LBBs -> Delete")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFLbbDeleteView", "DTGFLbbDeleteView"));
