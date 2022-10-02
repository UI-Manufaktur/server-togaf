module servers.togaf.views.lbbs.index;

@safe:
import servers.togaf;

class DTGFLbbIndexView : DMVCView {
  mixin(MVCViewThis!("TGFLbbIndexView"));

  override void initialize() {
    super.initialize;
  }
  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFLbbIndexView~":TGFLbbIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("LBBs -> Index")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFLbbIndexView", "DTGFLbbIndexView"));
