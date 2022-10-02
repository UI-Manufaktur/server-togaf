module servers.togaf.views.gbbs.index;

@safe:
import servers.togaf;

class DTGFGbbIndexView : DMVCView {
  mixin(MVCViewThis!("TGFGbbIndexView"));

  override void initialize() {
    super.initialize;
  }
  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFGbbIndexView~":TGFGbbIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("GBBs -> Index")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFGbbIndexView", "DTGFGbbIndexView"));
