module servers.togaf.controllers.actions.lbbs.update;

@safe:
import servers.togaf;

class DTGFLbbUpdateActionController : DMVCActionController {
  mixin(MVCControllerThis!("TGFLbbUpdateActionController"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerCalls!("TGFLbbUpdateActionController", "DTGFLbbUpdateActionController"));
