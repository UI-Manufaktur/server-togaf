module servers.togaf.views.lbbs.create;

@safe:
import servers.togaf;

class DTGFLbbCreateView : DMVCView {
  mixin(MVCViewThis!("TGFLbbCreateView"));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFLbbCreateView~":TGFLbbCreateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("LBBs -> Create")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFLbbCreateView", "DTGFLbbCreateView"));
