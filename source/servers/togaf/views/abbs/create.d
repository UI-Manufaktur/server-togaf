module servers.togaf.views.abbs.create;

@safe:
import servers.togaf;

class DTGFAbbCreateView : DMVCView {
  mixin(MVCViewThis!("TGFAbbCreateView"));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFAbbCreateView~":TGFAbbCreateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("ABBs -> Create")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFAbbCreateView", "DTGFAbbCreateView"));
