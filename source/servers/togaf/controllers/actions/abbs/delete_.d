module servers.togaf.controllers.actions.abbs.delete_;

@safe:
import servers.togaf;

class DTGFAbbDeleteActionController : DMVCActionController {
  mixin(MVCControllerThis!("TGFAbbDeleteActionController"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerCalls!("TGFAbbDeleteActionController", "DTGFAbbDeleteActionController"));
