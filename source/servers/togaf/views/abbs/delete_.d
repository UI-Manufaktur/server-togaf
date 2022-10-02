module servers.togaf.views.abbs.delete_;

@safe:
import servers.togaf;

class DTGFAbbDeleteView : DMVCView {
  mixin(MVCViewThis!("TGFAbbDeleteView"));

  override void initialize() {
    super.initialize;
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFAbbDeleteView~":TGFAbbDeleteView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("ABBs -> Delete")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFAbbDeleteView", "DTGFAbbDeleteView"));
