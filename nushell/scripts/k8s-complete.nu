# Get kubernetes pods
export def kpods []: nothing -> table<name: string, ready: string, status: string, age: datetime> {
    kubectl get pods -o json | from json | get items
        | each { |in| {
            name: $in.metadata.name,
            ready: ($in.status.containerStatuses
                | do {
                    let total = ($in | length)
                    let ready = ($in | where state.running? != null | length)
                    $"($ready)/($total)"
                }
            ),
            status: $in.status.phase,
            age: ($in.metadata.creationTimestamp | into datetime)
        }}
}