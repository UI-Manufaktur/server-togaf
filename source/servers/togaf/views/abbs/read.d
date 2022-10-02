module servers.togaf.views.abbs.read;

@safe:
import servers.togaf;

class DTGFAbbReadView : DMVCView {
  mixin(MVCViewThis!("TGFAbbReadView"));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFAbbReadView~":TGFAbbReadView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("ABBs -> Read")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFAbbReadView", "DTGFAbbReadView"));
